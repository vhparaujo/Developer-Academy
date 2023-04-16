import UIKit

var nome: String? // permite que seja aceito nulo, permite que seja um opcional
print(nome) //nil

nome = "Victor"
print(nome) //Optional("victor")

// primeira forma de tratar o Optional, ! diz que tem um valor
print(nome!)

if let nomeDesembrulhado = nome {
    print(nomeDesembrulhado)
} else {
    print("valor nulo")
}
