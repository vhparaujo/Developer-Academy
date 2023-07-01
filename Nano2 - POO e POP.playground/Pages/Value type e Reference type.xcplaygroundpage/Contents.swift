struct PessoaS {
  var nome: String
  var sobrenome: String
  var idade: Int
  
  init(nome: String, sobrenome: String, idade: Int) {
    self.nome = nome
    self.sobrenome = sobrenome
    self.idade = idade
  }
  
  func boasVindas() {
    print("Boas-vindas, \(nome) \(sobrenome)")
  }
}
var pessoa1 = PessoaS.init(nome: "John", sobrenome: "Doe", idade: 34)
var pessoa2 = pessoa1
pessoa1.nome = "Gabriel"
print(pessoa1.nome) // Gabriel
print(pessoa2.nome)

class Pessoa {
  var nome: String
  var sobrenome: String
  var idade: Int
  var carro: Carro
  
  init(nome: String, sobrenome: String, idade: Int, carro: Carro) {
    self.nome = nome
    self.sobrenome = sobrenome
    self.idade = idade
    self.carro = carro
  }
  
  final func boasVindas() {
    print("Boas-vindas, \(nome) \(sobrenome)")
  }
}

class TestePessoa: Pessoa {
  
}

protocol MusicalInstrument {
  var name: String { get }
  func makeSound() -> String
}

class Musician {
  var nomeMusica: String
  
  init(nomeMusica: String) {
    self.nomeMusica = nomeMusica
  }
  func play(instrument: MusicalInstrument) {
    instrument.makeSound()
    print("Playing \(instrument.name)")
  }
  
}

class Carro: Musician {
  var modelo: String
  var placa: String
  
  init(modelo: String, placa: String){
    self.modelo = modelo
    self.placa = placa
    super.init(nomeMusica: "Something just like this")
  }
  
}


var carro = Carro(modelo: "celta", placa: "OGS9A02")
var pessoa3 = Pessoa.init(nome: "John", sobrenome: "Doe", idade: 34, carro: carro)
var pessoa4 = pessoa3


pessoa3.nome = "Gabriel"
print(pessoa3.nome) // Gabriel
print(pessoa4.nome) // Gabriel


print(pessoa3.carro.modelo)
print(carro.nomeMusica)
