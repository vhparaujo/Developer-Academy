protocol MusicalInstrument {
  var name: String { get }
  func makeSound() -> String
}

extension MusicalInstrument {
  func outraFuncao() {
    
  }
}

struct Drum: MusicalInstrument {
  let name: String
  func makeSound() -> String {
    return "Tu dum tatz!"
  }
  
  func outraFuncao() -> String{
    
    return "a"
  }
}

var teste = Drum(name: "")
teste.outraFuncao()
print(teste.outraFuncao())



struct Guitar: MusicalInstrument {
  let name: String
  func makeSound() -> String {
    return "Blen blen!"
  }
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

var drum = Drum(name: "bateria")
var guitarra = Guitar(name: "Guitarra")
var musica = Musician(nomeMusica: "Tempo Perdido")
var musica1 = Musician(nomeMusica: "Tempo Perdido 2")

musica.play(instrument: guitarra)

class Carro: Musician {
  var modelo: String
  var placa: String
  
  init(modelo: String, placa: String){
    self.modelo = modelo
    self.placa = placa
    super.init(nomeMusica: "Something just like this")
  }
  
}
