namespace TeleportQubit{
    
    open Microsoft.Quantum.Canon;

    @EntryPoint()
    operation Main() : Bool {
        let sign = false;

        let result = TeleportNonclassicalQubit(sign);
		if (result == sign){
			Message($"teleportacja się udała, na wejściu: {sign}, na wyjściu: {result}");
		} else {
			Message($"teleportacja nieudana}");
		}
        return result;
    }
    operation QuantumTeleport (msg : Qubit, target : Qubit) : Unit {
        use middleMan = Qubit()
		{
			

			H(middleMan);
			CNOT(middleMan, target);
			CNOT(msg, middleMan);
			H(msg);
			let msgMeasurement = M(msg);
			let middlemanMeasurement = M(middleMan);
			
			if (msgMeasurement == One) { Z(target); } 	//If I measure 10, then your qubit is in state a|0> - b|1>, so you need to apply a Z gate to it to get it into the right state. I send you a message saying as much.
														//If I measure 11, then your qubit is in state a|1> - b|0>, so you need to apply a Z gate followed by an X gate to get it into the right state. I send you a message saying as much.

			if (middlemanMeasurement == One) { X(target);}	//kubit jest w stanie a|1> + b|0>, dlatego działamy X by otrzymać dany stan a|0> + b|1>

			Reset(middleMan);
		}			   		 	  
    }

	// tutaj rozważamy bardziej klasyczny stan, czyli nasz kubit jest albo |0> albo |1>

	operation TeleportClassicalMessage(message : Bool) : Bool
	{
		mutable measurement = false;

		use teleportPair = Qubit[2]
		{
			let msg = teleportPair[0];
			let target = teleportPair[1];
			// zaczynają jako |0>

			if (message) {X(msg);}		// tutaj mamy po prostu NOT gate

			QuantumTeleport(msg, target);	// teleportacja
			
			if (M(target) == One)
			{
				set measurement = true;
			}

			ResetAll(teleportPair);
		}

		return measurement;
	}

	// Now to send more complicated states:  We'll send some states of the form 1/sqrt(2)*( |0> +/- |1> ) .
	// Note that even though these are superpositions, we can still tell which of these two states we're in 
	// (granted we're told we're in one of these states) by applying a Hadamard gate.

	operation TeleportNonclassicalQubit(sign : Bool) : Bool
	{
		mutable measurement = false;
        Message("teleportation");
		use teleportPair = Qubit[2]
		{
			let msg = teleportPair[0];		//  |0>
			let target = teleportPair[1];	//

			if (sign) { X(msg); }			
			H(msg);							//  msg - 1/sqrt(2) * (|0> +/- |1>) w zależności od tego jaką wartość miał sign

			QuantumTeleport(msg, target);
			// target - 1/sqrt(2) * (|0> +/- |1>) w zależności od tego jaką wartość miał sign

			H(target);						// target jest teraz albo |0> albo |1>
			if (M(target) == One) {set measurement = true;}
						
			ResetAll(teleportPair);
		}

		return measurement;
	}


}