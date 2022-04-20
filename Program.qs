namespace QuantumHello {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    
    // @EntryPoint()
    operation TestInterference1() : Result {
        use q = Qubit();
        Message(" ");
        Message("At the beginning the qubit is in the state |0>.");
        DumpMachine();

        H(q);
        Message(" ");
        Message("After applying H the qubit is in a uniform superposition.");
        DumpMachine();
        
        H(q);
        Message(" ");
        Message("If we apply H again, interference gives back the state to |0>.");
        DumpMachine();

        Message(" ");
        Message("If we measure we always obtain 'Zero'.");
        return MResetZ(q);
    }

    // @EntryPoint()
    operation TestInterference2() : Result {
        use q = Qubit();
        Message("At the beginning the qubit is in the state |0>.");
        DumpMachine();
        Message(" ");

        X(q);
        Message("After X(q):");
        DumpMachine();
        Message(" ");

        H(q);
        Message("After H(q):");
        DumpMachine();

        return M(q);
    }

    @EntryPoint()
    operation TestInterference3() : Result {
        use q = Qubit();
        Message("At the beginning the qubit is in the state |0>.");
        DumpMachine();
        Message(" ");

        Y(q);
        Message("After Y(q):");
        DumpMachine();
        Message(" ");

        H(q);
        Message("After H(q):");
        DumpMachine();

        return M(q);
    }
}
