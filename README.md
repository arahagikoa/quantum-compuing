# quantum-compuing
quantum computing



## BRAMY
W naszym projekcie będziemy używali tylko części dostępnych bram kwantowych, będą to:

### jedno kubitowe bramy
Dzielimy je na:
- Brama X
Dostając stan kwantowy |0> zwraca |1>, a dostajac |1> zwraca |0>. Ogólniej rzecz ujmując ze stanu kwantowego: a|0> + b|1> tworzy b|0>+a|1>.

- Brama Z
zamienia |0> na |0> a |1> na -|1>. Innymi słowy:
a|0> + b|1> na a|0> - b|1>

- Brama Hadamarda
 zamienia |0> na 1/sqrt(2) * (|0> + |1>) natomiast |1| na 1/sqrt(2) * (|0> - |1>). Wykonuje on operacje na kubicie wejściowym, który na sferze Blocha mógłby być zintepretowany jako ustawienie stanu tego kubitu na "równiku" sfery, to jest w miejscu gdzie zmierzenia stanu 0 lub 1 są równie prawdopodobne.

### dwu kubitowe bramy  
    - Brama CNOT
    W uproszczeniu ta brama wykonuje operacje NOT na drugim kubicie jeśli pierwszy kubit ma wartość 1. Przykład:
    -- |00> na |00> 
    -- |01> na |01>
    -- |10> na |11>
    -- |11> na |10>