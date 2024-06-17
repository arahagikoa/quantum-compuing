namespace GroversAlgorithm {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Diagnostics;

    @EntryPoint()
    operation Main() : Result[] {
        let nQubits = 4; // Ustawia liczbę kubitów na 4.
        let iterations = CalculateOptimalIterations(nQubits); // Oblicza optymalną liczbę iteracji algorytmu Grovera.
        Message($"Liczba iteracji: {iterations}"); // Wyświetla liczbę iteracji.

        // Użyj algorytmu Grovera do znalezienia konkretnego oznaczonego stanu.
        let results = GroverSearch(nQubits, iterations, ReflectAboutMarked); // Wykonuje wyszukiwanie Grovera z określoną liczbą kubitów, iteracji i fazową bramką odbicia.
        return results; // Zwraca wyniki pomiarów.
    }

    operation GroverSearch(
        nQubits : Int,
        iterations : Int,
        phaseOracle : Qubit[] => Unit) : Result[] { 

        use qubits = Qubit[nQubits]; // Alokuje kubity.

        PrepareUniform(qubits); // Przygotowuje kubity w jednolitej superpozycji.

        for _ in 1..iterations { 
            phaseOracle(qubits); // Aplikuje fazową bramkę odbicia dla oznaczonego stanu.
            ReflectAboutUniform(qubits); // Aplikuje odbicie względem stanu jednolitego.
        }

        // Zmierz i zwróć wynik.
        return MResetEachZ(qubits); // Mierzy kubity i resetuje je do stanu |0⟩.
    }

    // Funkcja CalculateOptimalIterations oblicza optymalną liczbę iteracji algorytmu Grovera.
    function CalculateOptimalIterations(nQubits : Int) : Int {
        if nQubits > 63 { // Sprawdza, czy liczba kubitów nie przekracza 63.
            fail "Ten przykład obsługuje maksymalnie 63 kubity."; // Zgłasza błąd, jeśli liczba kubitów jest zbyt duża.
        }
        let nItems = 1 <<< nQubits; // Oblicza liczbę możliwych stanów dla nQubits kubitów (2^nQubits). np dla 4 qubitów jest to 2^4

        let angle = ArcSin(1. / Sqrt(IntAsDouble(nItems))); // Oblicza kąt na sferze Blocha potrzebny do estymacji prawdopodobieństwa.
        let iterations = Round(0.25 * PI() / angle - 0.5); // Oblicza optymalną liczbę iteracji algorytmu Grovera na podstawie analizy matematycznej.
        return iterations; 
    }

    operation ReflectAboutMarked(inputQubits : Qubit[]) : Unit {
        Message("Odbicie względem oznaczonego stanu..."); 
        use outputQubit = Qubit();
        within {
            //Wyjściowy kubit outputQubit jest początkowo w stanie |0⟩. Operacja X(outputQubit) zmienia jego stan na |1⟩, 
            //a następnie operacja Hadamarda H(outputQubit) przekształca go w stan superpozycji (1/√2) * (|0⟩ - |1⟩), 
            //który jest nazywany stanem minusowym (|-⟩).
            X(outputQubit); 
            H(outputQubit); 
            // Pętla for przechodzi przez kubity inputQubits co drugi kubit (indeksy 0, 2, 4, ...) i aplikuje na nie operację X.
            // To przekształca wybrane kubity wejściowe z |0⟩ na |1⟩ lub z |1⟩ na |0⟩.
            for q in inputQubits[...2...] {
                X(q);
            }
        } apply {
            Controlled X(inputQubits, outputQubit);
            //Operacja Controlled X(inputQubits, outputQubit) (CNOT) działa w taki sposób, że odwraca stan outputQubit tylko wtedy, 
            //gdy wszystkie inputQubits są w stanie |1⟩. 
        }
    }

    // Operacja PrepareUniform przygotowuje kubity w jednolitej superpozycji.
    operation PrepareUniform(inputQubits : Qubit[]) : Unit is Adj + Ctl { //adjont do odwrotności oraz ctl do controlled.
        for q in inputQubits {
            H(q); // Aplikuje bramkę Hadamarda, tworząc jednolitą superpozycję.
        }
    }

    // Operacja ReflectAboutAllOnes implementuje odbicie względem stanu wszystkich jedynek.
    // Stan wszystkich jedynek to stan w którym wszystkie qubity są w stanie |1>. Dla n qubitów jest to stan |111...1>
    // Operacja odbicia względem stanu wszystkich jedynek zmienia fazę tego konkretnego stanu na przeciwną. 
    operation ReflectAboutAllOnes(inputQubits : Qubit[]) : Unit {
        Controlled Z(Most(inputQubits), Tail(inputQubits)); // Aplikuje kontrolowaną bramkę Z do ostatniego kubitu, jeśli wszystkie pozostałe są w stanie |1⟩.
        //Most(inputQubits) zwraca tablice z wyjątkiem ostatniego elementu.
        //Tail zwraca ostatni element z Most(inputQubits)
    }

    // Operacja ReflectAboutUniform implementuje odbicie względem jednolitego stanu.
    // Operacja odbicia względem jednolitego stanu polega na przekształceniu każdej amplitudy w taki sposób, że amplituda stanów różni się o dwukrotność średniej amplitudy. 
    operation ReflectAboutUniform(inputQubits : Qubit[]) : Unit {
        within {
            Adjoint PrepareUniform(inputQubits); // Przekształca jednolitą superpozycję do stanu wszystkich zer.
            for q in inputQubits { // Dla każdego kubitu:
                X(q); // Aplikuje bramkę X, przekształcając stan wszystkich zer do stanu wszystkich jedynek.
            }
        } apply {
            ReflectAboutAllOnes(inputQubits); 
        }
    }
}