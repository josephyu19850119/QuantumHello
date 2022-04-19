namespace QuantumHello {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    
    @EntryPoint()
    operation GenerateRandomBit() : Result {
        use q = Qubit();

        Message("Initialized qubit:");
        DumpMachine();
        Message("");

        H(q);
        Message("Qubit after applying H:");
        DumpMachine();
        Message(" ");

        let randomBit = M(q);
        Message("Qubit after the measurement:");
        DumpMachine();
        Message(" ");

        Reset(q);
        Message("Qubit after resetting:");
        DumpMachine();
        Message(" ");
        
        return randomBit;
    }
}
