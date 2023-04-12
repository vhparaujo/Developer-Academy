import UIKit

// desafio gasolina e alcool
var litroGasolina: Float = 5.55
var litroAlcool: Float = 3.55

var maisVantajoso: Float = litroAlcool/litroGasolina

// declaracao de constante
let valorDeRefencia: Float = 0.70

if(maisVantajoso <= valorDeRefencia){
    print("O combustivel mais vantajoso eh: alcool por estar custando \(litroAlcool)")
} else {
    print("O combustivel mais vantajoso eh: gasolina por estar custando \(litroGasolina)")
}

// forma mais enxuta
print("Eh mais vantasojo usar \((litroAlcool/litroGasolina) <= 0.70 ? "Alcool" : "Gasolina " ).")

