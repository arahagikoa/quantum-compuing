namespace QuantumApplication {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;

    @EntryPoint()
    //operation HelloQ() : Unit {
   //     Message("Hello quantum world!");
    //}

    operation GenerateRandomBit() : Result {
        use q = Qubit();

        H(q);


        let result = M(q);


        Reset(q);


        return result;

    }

    
}

