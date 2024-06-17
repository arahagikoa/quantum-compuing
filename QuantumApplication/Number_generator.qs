namespace QuantumApplication {

    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;

    @EntryPoint()   // here code starts. Like main in normal language.
    operation Main() : Int {
        let max = 100;
        Message($"Sampling a random number between 0 and {max}: ");
        return GenerateRandomNubmerInRange(max);
    }

    operation GenerateRandomBit() : Result{
        // Alocate qubit
        use q = Qubit();

        //Set qubit into superposition of 0 and 1 using Hadamard
        H(q);

        // At this point the qubit `q` has 50% chance of being measured in the
        // |0〉 state and 50% chance of being measured in the |1〉 state.
        // Measure the qubit value using the `M` operation, and store the
        // measurement value in the `result` variable.

        let result = M(q);

        Reset(q);

        //Return the result of hte measurement

        return result;
    }
    
    /// Generates a random number between 0 and `max`.
    operation GenerateRandomNubmerInRange(max : Int) : Int {

        mutable bits = []; //In Q#, mutable is a keyword used to declare variables whose values can be changed after their initial assignment. 
        //This is in contrast to immutable variables, which cannot be changed once they are set.
        let nBits = BitSizeI(max); // calculate bits that it needs to store the value
        for idxBit in 1..nBits{ // for loop from 1 to nbits (inclusive)
            set bits += [GenerateRandomBit()];
        }
        let sample = ResultArrayAsInt(bits);  // changes sample itno int value
        
        // Return random number if it is within the requested range.
        // Generate it again if it is outside the range.

        return sample > max ? GenerateRandomNubmerInRange(max) | sample;
    }
}

