import UIKit

// teste do switch case
var testeMeuNumero: Int = 1

switch (testeMeuNumero) {
    
case 1:
    print("Meu numero eh 1")
case 2:
    print("Meu numero eh 2")
default:
    print("Valor nao encontrado")
}

// desafio de calcular o IMC
var peso1: Double = 50
var altura1: Double = 1.75

var imc: Double = peso1/(altura1*altura1)

// range do imc via switch case
switch imc {
    
case ...18.4:
    print("Magro, imc = \(round(imc))")
case 18.5...24.9:
    print("Peso normal, imc = \(imc)")
case 25...29.9:
    print("Sobrepeso, imc = \(imc)")
case 30...34.9:
    print("Obesidade grau 1, imc = \(imc)")
case 35...40:
    print("Obesidade grau 2, imc = \(imc)")
default:
    print("Obesidade grau 3, imc = \(imc)")
}

// range do imc via if
if(imc < 18.5){
    print("Magro, imc = \(String(format: "%.2lf", imc))")
} else if(imc < 25){
    print("Peso normal, imc = \(imc)")
} else if(imc < 30){
    print("Sobrepeso, imc = \(imc)")
} else if(imc < 35){
    print("Obesidade grau 1, imc = \(imc)")
} else if(imc <= 40){
    print("Obesidade grau 2, imc = \(imc)")
} else {
    print("Obesidade grau 3, imc = \(imc)")
}
