import UIKit

/*
 comentario em bloco
*/

// declarando variaveis
var idade: Int = 20
//idade = "" Swift eh fortemente tipada, por isso nao aceita trocar o tipo da variavel
var peso: Float = 60.588888888 // na quarta casa arredondou
var altura: Double = 1.75
var nome: String = "Victor Hugo"
var tipo: Bool = true

var match: Bool = true

if(match == true) {
    print("DEU MATCH")
} else {
    print("NÃO DEU MATCH")
}

var oculos: Bool = true

if(oculos == false) {
    print("Se usa oculos consegue enxergar")
} else {
    print("Se nao usa nao enxerga")
}

var newVar = "Teste"
print(newVar)
print(newVar)

var meuNome: String = "Victor Hugo Pacheco Araujo"

if(nome == meuNome) {
    print("Nome igual")
} else {
    print("Nome não bateu")
}

var numero: Int = 10
var numero2: Int = 10

if(numero == numero2) {
    print("Numeros iguais")
} else {
    print("Numeros diferentes")
}

//o tipo primitivo nao e um tipo acessivel em swift
//var teste:int = 9

//print("Por favor escreva a sua linguagem de programacao favorita: ")
//let name = readLine()
//print("Sua linguagem favorita eh \(name!).")
