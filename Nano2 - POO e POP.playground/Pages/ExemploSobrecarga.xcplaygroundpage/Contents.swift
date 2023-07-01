// Erros que podem ter em uma transferencia
enum Erro: String {
  case Saldo = "Saldo insuficiente"
  case Valor = "Valor inválido"
}

// Classe conta, com agência, saldo e número da conta
class Conta {
  
  var saldo: Double = 0.0 // Valor variável
  var agencia: Int = 0
  var numero: Int = 0
  var cpf: String = ""
  
  var pix: String = ""

  // Inicializador somente com agência e conta, uma vez que o saldo sempre começa zerado
  init(agencia: Int, numero: Int, cpf: String) {
    self.agencia = agencia
    self.numero = numero
    self.cpf = cpf
  }
  
  convenience init(pix: String) {
    self.init(agencia: 1111, numero: 121212, cpf: "000000000-00")
    self.pix = pix
  }
  
  // Função de saque
  func saca(valor: Double) {
    if self.saldo < valor { // Saque não pode ser maior do que o saldo da conta
      print(Erro.Saldo)
    }
    self.saldo -= valor
  }
  
  func deposita(valor: Double) {
    self.saldo += valor
  }
  
  // Função de transferência PIX por email
  func transfere(valor: Double, ted: Conta) {
    if valor < 0.0 { // Valor não pode ser negativo
      print(Erro.Valor)
    } else if valor > saldo { // Tranferência não pode ser maior do que o saldo
      print(Erro.Saldo)
    }
    saca(valor: valor)
    ted.deposita(valor: valor)
  }
  
  // Telefone Celular
  func transfere(valor: Double, pix: Conta) {
    if valor < 0.0 {
      print(Erro.Valor)
    } else if valor > saldo {
      print(Erro.Saldo)
    }
    
    saca(valor: valor)
    pix.deposita(valor: valor)
    
  }
}

var conta1 = Conta(agencia: 5555, numero: 454545, cpf: "390293586-09")
var conta2 = Conta(pix: "teste@apple.com")
var conta3 = Conta(agencia: 4444, numero: 676767, cpf: "980787475-87")

conta1.deposita(valor: 100)
conta1.transfere(valor: 30, pix: conta2)
conta1.transfere(valor: 10, ted: conta3)

print("Saldo conta1: \(conta1.saldo)")
print("Saldo conta2: \(conta2.saldo)")
print("Saldo conta3: \(conta3.saldo)")
