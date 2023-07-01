protocol Animal {
  var species: String { get }
  var canFly: Bool { get }
}

protocol Flyable {
    var maximumSpeed: Double { get }
}

struct Macaw: Animal, Flyable{
    var species: String = "Anodorhynchus leari"
    var canFly: Bool = true
    var maximumSpeed: Double
    // teste
    var nome: String?
}

struct Monkey: Animal{
    var species: String = "Sapajus apella"
    var canFly: Bool = false
}

extension Animal{
    var canFly: Bool { return self is Flyable }
}
