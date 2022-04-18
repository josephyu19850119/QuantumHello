namespace QuantumHello {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    
    operation GenerateRandomBit() : Result {
        use q = Qubit();
        H(q);
        return M(q);
    }

    operation SampleRandomNumberInRange(min: Int, max: Int) : Int {  
        mutable output = 0;
        repeat {
            mutable bits = []; 
            for idxBit in 1..BitSizeI(max - min) {
                set bits += [GenerateRandomBit()];
            }
            set output = ResultArrayAsInt(bits);
        }
        until(output <= max - min);
        
        return min + output;
    }

    @EntryPoint()
    operation SampleRandomNumber() : Int {
        let min = 40;
        let max = 50;
        Message($"Sampling a random number between {min} and {max}: ");
        return SampleRandomNumberInRange(min, max);

    }
}
