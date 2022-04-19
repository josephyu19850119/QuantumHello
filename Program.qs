namespace QuantumHello {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Convert;
    
    @EntryPoint()
    operation GenerateRandomNumber() : Int {
        use qubits = Qubit[3];
        Message("The qubit register just be allocated: ");
        DumpMachine();

        ApplyToEach(H, qubits);
        Message("The qubit register in a uniform superposition: ");
        DumpMachine();
        let result = ForEach(M, qubits);
        Message("Measuring the qubits collapses the superposition to a basis state.");
        DumpMachine();

        // Alternative measurement one by one qubit
        // mutable result = new Result[0];
        // for q in qubits {
        //     Message("");
        //     set result += [M(q)];
        //     DumpMachine();
        // }

        Message(" ");
        Message("Your random number is: ");
        return BoolArrayAsInt(ResultArrayAsBoolArray(result));
    }
}
