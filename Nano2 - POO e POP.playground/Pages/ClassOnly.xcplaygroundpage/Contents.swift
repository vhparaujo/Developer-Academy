protocol TesteGetESet: AnyObject {
  var get: String { get }
  var set: String { get set }
  
}

class TestandoGetESet: TesteGetESet {
  var get: String = ""
  var set: String = ""
  
}
