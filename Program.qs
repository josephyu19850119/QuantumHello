namespace QuantumHello {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    operation SetQubitState(desired : Result, target : Qubit) : Unit {
        if desired != M(target) {
            X(target);
        }
    }

    @EntryPoint()
    operation TestBellState(count : Int, initial : Result) : (Int, Int, Int, Int) {
        mutable numOnesQ1 = 0;
        mutable numOnesQ2 = 0;

        use (q1, q2) = (Qubit(), Qubit());
        for test in 1..count {
            SetQubitState(initial, q1);
            SetQubitState(Zero, q2);

            H(q1);
            CNOT(q1, q2);
            // Controlled X(q1, q2);

            let resultQ1 = M(q1);
            let resultQ2 = M(q2);

            if resultQ1 == One {
                set numOnesQ1 += 1;
            }
            if resultQ2 == One {
                set numOnesQ2 += 1;
            }
        }

        SetQubitState(Zero, q1);
        SetQubitState(Zero, q2);

        Message("q1:Zero, One  q2:Zero, One");
        return (count - numOnesQ1, numOnesQ1, count - numOnesQ2, numOnesQ2);
    }
}
