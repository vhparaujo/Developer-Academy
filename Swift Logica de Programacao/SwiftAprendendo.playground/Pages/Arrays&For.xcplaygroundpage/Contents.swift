import UIKit

// sintaxe declaracao de um array de Strings
var colecao: [String] = ["caneta1", "caneta2", "caneta3"]

// sintaxe do for para uma colecao
for caneta in colecao {
    print(caneta)
}

for numero in 1...10{
    print(numero)
}

// desafio da fila de pessoas
var fila: [String] = ["victor", "suarez", "messi"]

for pessoas in fila {
    print(pessoas)
}

print("----------------------")

var idoso: String = "raimundo nonato"

fila.insert(idoso, at: 0)

for pessoas in fila {
    print(pessoas)
}

print("----------------------")

// metodo para ordenar
fila.sort()
print("Mostrando em ordem alfabetica: ")
for pessoas in fila {
    print(pessoas)
}

print("numero de elementos na fila: ", fila.count)

print("----------------------")

// joined(separator: ) faz a concatenacao dos elementos do array e usa o separator para definir a forma de
// separacao
print("testando o joined em ordem alfabetica: ", fila.joined(separator: ", "))

// metodo append() serve para adicionar um novo elemento no final do array
fila.append("teste")
print("testando o append(): ", fila.joined(separator: ", "))

// permite adicionar mais de um elemento
fila.append(contentsOf: ["novo1", "novo2"])
print("testando o append() com o contentsOf: ", fila.joined(separator: ", "))

// testando trazer o elemento de acordo com a posicao
print("testando o index: ", fila[0])

print("----------------------")
