import UIKit

class Carro {
    
    var marca: String = "Chevrolet"
    var modelo: String = "Celta"
    var combustivel: String
    var potencia: String
    var ano: Int
    
    // init() eh o construtor da classe
    init(marca: String, modelo: String, combustivel: String, potencia: String, ano: Int) {
        self.marca = marca
        self.modelo = modelo
        self.combustivel = combustivel
        self.potencia = potencia
        self.ano = ano
    }
    
    func liga() {
        print("Carra ligado")
    }
    
    func acelera() {
        print("Acelerando carro")
    }
    
    func freia() {
        print("Parando o carro")
    }
    
    func desliga() {
        print("Desligando o carro")
    }
    
}

var carro1 = Carro(marca: "Chevrolet", modelo: "Celta", combustivel: "gasolina", potencia: "98cc", ano: 2012)
var carro2 = Carro(marca: "Jeep", modelo: "Compass", combustivel: "gasolina", potencia: "156cc", ano: 2018)

carro1.liga()

var nome = carro1.modelo
print(nome)

// desafio 1 Orientacao a Objetos
class Animal {
    
    var nome: String
    var classe: String
    var alimentacao: String
    var habitat: String
    
    init(nome: String, classe: String, alimentacao: String, habitat: String) {
        self.nome = nome
        self.classe = classe
        self.alimentacao = alimentacao
        self.habitat = habitat
    }
    
    func come() {
        print("Animal esta comendo")
    }
    
    func respira() {
        print("Animal esta respirando")
    }
    
    func dorme() {
        print("Animal esta dormindo")
    }
}


var animal = Animal(nome: "gato", classe: "mamifero", alimentacao: "carnivoro", habitat: "terra")

animal.come()

var animais = animal.nome
print(animais)


// testando classe sem construtor inicializado
class Teste {
    
    var teste1: Int = 1
    
    func mostrar(){
        print("teste")
    }
    
}

var t = Teste()
t.mostrar()
