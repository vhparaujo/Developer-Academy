import UIKit

var inteiro: Int = 10
// fazendo a conversao de Inteiro para Double
var decimal: Double = Double(inteiro)
// fazendo a conversao de Inteiro para String
var palavra: String = String(inteiro)

print(decimal)
print(palavra)

let texto: String = "20"

// fazendo a conversao de String para Int
if let i = Int(texto) {
    print(texto)
} else {
    print("Nao foi possivel fazer a conversao de String para Int")
}

let texto2: String = "9"

// fazendo a conversao de String para Double
if let d = Double(texto2) {
    print(d)
} else {
    print("Nao foi possivel fazer a conversao de String para Double")
}

// fazendo a conversao de Double para String
let d2: Double = 20
let texto3: String = String(d2)
print(texto3)

// fazendo a conversao de Inteiro para String
let d3: Int = 600
let texto4: String = String(d3)
print(texto4)
