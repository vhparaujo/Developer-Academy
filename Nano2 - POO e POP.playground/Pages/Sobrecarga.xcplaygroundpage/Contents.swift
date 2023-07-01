//sobrecarga de operadores
func + (lhs: Int, rhs: Double) -> Int {
    return lhs + Int(rhs)
}

let n1: Int = 10
let n2: Double = 10.9
let sum = n1 + n2
print(sum)

class Desfavoravel {
  
  @_disfavoredOverload
  func sameName() -> Double{return 0}
  
  func sameName() -> Int{return 0}
  func sameName() -> String{return ""}
  
}
