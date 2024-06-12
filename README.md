# quantum-compuing
quantum computing

### Qubity
Od bitów do kubitów
Komputer cyfrowy zarówno przechowuje, jak i przetwarza informacje za pomocą bitów, które mogą mieć wartość 0 lub 1. Fizycznie bitem może być wszystko, co ma dwie różne konfiguracje: jedną reprezentowaną przez „0” i drugą reprezentowaną przez „1”. Może to być włączona lub wyłączona żarówka, moneta będąca orłem lub reszką lub dowolny inny system z dwiema odrębnymi i rozpoznawalnymi możliwościami. We współczesnej informatyce i komunikacji bity są reprezentowane przez brak lub obecność sygnału elektrycznego, kodującego odpowiednio „0” i „1”.

Bit kwantowy to dowolna część wykonana z układu kwantowego, takiego jak elektron lub foton. Podobnie jak bity klasyczne, bit kwantowy musi mieć dwa różne stany: jeden reprezentujący „0” i drugi reprezentujący „1”. W przeciwieństwie do bitu klasycznego, bit kwantowy może również istnieć w stanach superpozycji, podlegać niezgodnym pomiarom, a nawet być splątany z innymi bitami kwantowymi. Możliwość wykorzystania mocy superpozycji, interferencji i splątania sprawia, że ​​kubity są zasadniczo inne i znacznie potężniejsze niż klasyczne bity.

Do budowy komputerów kwantowych i innych technologii informacji kwantowej potrzebujemy obiektów kwantowych, które będą działać jak kubity. Naukowcy nauczyli się wykorzystywać i kontrolować wiele układów fizycznych, aby działały jak kubity. Dzięki temu możemy dopasować wymagania różnych technologii kwantowych do zalet każdego typu kubitu.

# Spin

Większość cząstek kwantowych zachowuje się jak małe magnesy. Nazywamy to spinem własności. Orientacja wirowania jest zawsze skierowana całkowicie w górę lub całkowicie w dół, ale nigdy pomiędzy. Korzystając ze stanów spinowych w górę i w dół, możemy zbudować kubit spinowy.

0 = skierowany w górę, 1 = skierowany w dół

# Uwięzione atomy i jony

Poziomy energii elektronów w neutralnych atomach lub jonach możemy wykorzystać jako kubity. W swoim naturalnym stanie elektrony te zajmują najniższy możliwy poziom energii. Za pomocą laserów możemy je „podniecić” na wyższy poziom energii. Możemy przypisać wartości kubitów na podstawie ich stanu energetycznego.

0 = stan niskiej energii, 1 = stan wysokiej energii

# Fotony

Fotony, które są pojedynczymi cząsteczkami światła, możemy wykorzystać jako kubity na kilka sposobów.

POLARYZACJA QUBIT:
Każdy foton niesie pole elektromagnetyczne o określonym kierunku, zwanym jego polaryzacją. Dwa stany użyte do zdefiniowania kubitów to polaryzacja pozioma i polaryzacja pionowa.

0 = poziomo, 1 = pionowo

# Qubit scieżki fotonu

Ścieżka, którą podąża foton, to kolejny sposób zdefiniowania kubitu. W rzeczywistości możemy umieścić foton w superpozycji bycia „tutaj” i „tam”, używając rozdzielaczy wiązki.

0 = ścieżka górna, 1 = ścieżka dolna

## BRAMY
W naszym projekcie będziemy używali tylko części dostępnych bram kwantowych, będą to:

## jedno kubitowe bramy
Dzielimy je na:
- Brama X
Dostając stan kwantowy |0> zwraca |1>, a dostajac |1> zwraca |0>. Ogólniej rzecz ujmując ze stanu kwantowego: a|0> + b|1> tworzy b|0>+a|1>.

- Brama Z
zamienia |0> na |0> a |1> na -|1>. Innymi słowy:
a|0> + b|1> na a|0> - b|1>

- Brama Hadamarda
 zamienia |0> na 1/sqrt(2) * (|0> + |1>) natomiast |1| na 1/sqrt(2) * (|0> - |1>). Wykonuje on operacje na kubicie wejściowym, który na sferze Blocha mógłby być zintepretowany jako ustawienie stanu tego kubitu na "równiku" sfery, to jest w miejscu gdzie zmierzenia stanu 0 lub 1 są równie prawdopodobne.

## dwu kubitowe bramy  
    - Brama CNOT
    W uproszczeniu ta brama wykonuje operacje NOT na drugim kubicie jeśli pierwszy kubit ma wartość 1. Przykład:
    -- |00> na |00> 
    -- |01> na |01>
    -- |10> na |11>
    -- |11> na |10>

## Brama Hadamarda
    Brama Hadamarda jest jedną z fundamentalnych bram w kwantowych obwodach, która wprowadza superpozycję między stanami |0⟩ i |1⟩ na pojedynczym kubicie. To znaczy, że po zastosowaniu bramy Hadamarda na kubicie w stanie |0⟩ otrzymamy stan |+⟩ (superpozycja |0⟩ i |1⟩), a na kubicie w stanie |1⟩ otrzymamy stan |−⟩ (różnica między |0⟩ i |1⟩).

    Generator liczb losowych:
    W algorytmach kwantowych, bramy Hadamarda mogą być wykorzystane w konstrukcji generatora liczb losowych. Proces ten obejmuje wykorzystanie superpozycji wprowadzonej przez bramy Hadamarda, aby uzyskać losowe bity. Następnie te bity mogą być użyte do wygenerowania losowej liczby z określonego zakresu.