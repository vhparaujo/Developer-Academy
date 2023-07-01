import Foundation

enum TiposRendaFixa {
    case CDB
    case TesouroDireto
}
struct RendaFixa {
    let tipo: TiposRendaFixa
    let valor: Double
    let periodo: String
}

enum TiposRendaVariavel {
    case Acoes
    case FundosImobiliarios
}
struct RendaVariavel {
    let tipo: TiposRendaVariavel
    let codigo: String
    let cota: UInt
    let precoPorCota: Double
}

class Conta {
    private let codigoBanco: UInt
    private let agencia: UInt
    private let conta: UInt
    private let cpf: String
    private let nome: String
    var saldo: Double
    
    private var investimentosRendaFixa: [RendaFixa] = []
    private var investimentosRendaVariavel: [RendaVariavel] = []
    var totalInvestido: Double = 0.0
    
    static let taxaDeInvestimento: Double = 4.99
    
    init(nome: String, cpf: String) {
        let numeroConta = UInt.random(in: 10_000...99_999)
        
        self.nome = nome
        self.cpf = cpf
        codigoBanco = 1111
        agencia = 1
        conta = numeroConta
        saldo = 0.0
    }
    
    convenience init(nome: String, cpf: String, depositoInicial: Double) {
        self.init(nome: nome, cpf: cpf)
        saldo = depositoInicial
    }
    
    func investir(rendaFixa: RendaFixa) {
        let valorInvestido = rendaFixa.valor
        assert(valorInvestido <= saldo)
        saldo -= valorInvestido
        totalInvestido += valorInvestido
        
        investimentosRendaFixa.append(rendaFixa)
    }
    
    func investir(rendaVariavel: RendaVariavel) {
        assert(rendaVariavel.cota > 0)
        
        let valorInvestimento = (Double(rendaVariavel.cota) * rendaVariavel.precoPorCota) + Conta.taxaDeInvestimento
        assert(valorInvestimento <= saldo)
        
        saldo -= valorInvestimento
        totalInvestido += valorInvestimento
        
        investimentosRendaVariavel.append(rendaVariavel)
    }
}
extension Conta: CustomStringConvertible {
    var description: String {
        return """
        ---
        Nome: \(nome)
        Cpf: \(cpf)
        Banco: \(codigoBanco) | Agencia: \(agencia) | Conta: \(conta)
        Saldo: \(String(format: "R$ %.2f", saldo))
        Total Investido: \(String(format: "R$ %.2f", totalInvestido))
        """
    }
}

let minhaConta = Conta(nome: "Fulano", cpf: "000000001-01", depositoInicial: .random(in: 12_000...15_000))
minhaConta.investir(rendaFixa: RendaFixa(tipo: .TesouroDireto, valor: 2128, periodo: "D+180"))
minhaConta.investir(rendaVariavel: RendaVariavel(tipo: .Acoes ,codigo: "AAPL", cota: 50, precoPorCota: 180))
print(minhaConta)
