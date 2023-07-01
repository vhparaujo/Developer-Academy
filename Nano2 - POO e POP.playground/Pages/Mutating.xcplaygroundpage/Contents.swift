
struct Mutating {
  var nome: String
  
  mutating func setNome(nome: String) {
    self.nome = nome
  }
  
}

class Mudando {
  var nome: String
  
  init(nome: String) {
    self.nome = nome
  }
  
  func setNome(nome: String) {
    self.nome = nome
  }
  
}

struct Stack {
  public private(set) var items = [Int]() // Empty items array
  
  mutating func push(_ item: Int) {
    items.append(item)
  }
  
  mutating func pop() -> Int? {
    if !items.isEmpty {
      return items.removeLast()
    }
    return nil
  }
}

var stack = Stack()
stack.push(4)
stack.push(78)
stack.items // [4, 78]
stack.pop()
stack.items // [4]
