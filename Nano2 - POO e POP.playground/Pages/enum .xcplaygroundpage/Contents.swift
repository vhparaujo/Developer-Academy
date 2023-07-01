enum VehicleType : String {
  case twoWheeler = "TwoWheeler"
  case fourWheeler = "FourWheeler"
}

class Vehicle{

  var vehicleType : VehicleType

  init(vehicleType: VehicleType) {
    self.vehicleType = vehicleType
    print("Class Vehicle. vehicleType is \(self.vehicleType.rawValue)\n")
  }

  convenience init()
  {
    self.init(vehicleType: .fourWheeler)
  }
}

enum TwoWheelerType : String
{
  case scooty = "Scooty"
  case bike = "Bike"
}

class TwoWheeler : Vehicle{

  var twoWheelerType : TwoWheelerType
  var manufacturer : String

  init(twoWheelerType : TwoWheelerType, manufacturer : String, vType : VehicleType) {
    self.twoWheelerType = twoWheelerType
    self.manufacturer = manufacturer
    print("Class TwoWheeler. \(self.twoWheelerType.rawValue) manufacturer is \(self.manufacturer)")
    super.init(vehicleType: vType)

  }

  override init(vehicleType: VehicleType) {
    print("Class TwoWheeler. Overriden Initializer. \(vehicleType.rawValue)")
    self.twoWheelerType = .bike
    self.manufacturer = "Not defined"
    super.init(vehicleType: vehicleType)
  }

}


enum Cores: Float {
case white, blue, purple, brown, black, red
}

var myCores :Cores = .white
print(myCores.rawValue)

switch myCores {
case .white:
  print ("Iniciante")
case .blue:

  print("Iniciante")
case .purple:

  print("Intermediario")
case .brown:

  print ("Intermediario")
case .black:

  print ("Avançado")
case .red:

  print ("Avançado" )
}

enum BeltColor{
  case white
  case blue
  case purple
  case brown
  case black(String) //associated values
  case red
}

var myBelt: BeltColor = .black("30 grau")

print ("A minha faixa no Jiu Jitsu é: \(myBelt)")


enum ArrayEnum: CaseIterable{
  case white, blue, purple, brown, black, red
}

var list = ArrayEnum.allCases // foi gerado com uma unica linha um array
print( "Existem \(list.count) faixas no Jiu Jitsu!")

// inicializador em enum
enum TesteInit{
  
  case white, blue, purple, brown, black, red
  // Initializers
  init (years: Int) {
    if years <= 1{
      self = .white
    }else{
      self = .blue
    }
  }
  
}
var studentColor = TesteInit(years: 0)
print ("O aluno é faixa: \(studentColor)")

