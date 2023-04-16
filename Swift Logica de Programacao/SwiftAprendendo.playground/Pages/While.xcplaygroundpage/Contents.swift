import UIKit

var iteracao: Int = 0

// testando o while
while (iteracao <= 5) {
    iteracao = Int.random(in: 1...10)
    print(iteracao)
}

// desafio 1 do while
// variavel de incremento
var n: Int = 0

// while para iterar 100 vezes
while (n <= 100) {
    if(n % 10 == 0){
        print("Victor Hugo Pacheco Araujo: \(n)")
    }
    n+=1
}
