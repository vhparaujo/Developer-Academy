//Desafio 1: O coordenador do curso de Gastronomia da UCB, solicitou apoio aos alunos do Developer Academy para criar um programa que apoie a dinâmica de apresentação dos alunos na aula inaugural do 2º semestre de 2023. Para isso, o coordenador nos encaminhou os dados que devem ser informados para cada aluno no programa e as funcionalidades esperadas pelo programa:
//nome;
//idade;
//comidasPrediletas;
//apresentacaoDoAluno() que imprime "Olá, meu nome é {nome}”;
//fezAniversario() que aumenta a idade em 1;
//adicionaComidaPredileta(_:) que adiciona uma comida à lista de comidas favoritas do aluno;
//imprimeIdade() que imprime a idade do aluno;
//imprimeComidasPrediletas() que imprime a lista de comidas favoritas, uma por linha;

class Apresentacao {
    
    var nome: String
    var idade: Int
    var comidasPrediletas: [String]
    
    init(nome: String, idade: Int, comidasPrediletas: [String]) {
        self.nome = nome
        self.idade = idade
        self.comidasPrediletas = comidasPrediletas
    }
    
    func apresentacaoDoAluno() {
        print("Olá, meu nome eh \(self.nome)")
    }
    
    func fezAniversario() {
        self.idade+=1
        print("Sua nova idade eh \(self.idade)")
    }
    
    func adicionaComidaPredileta(_ comidas: Array<String>) {
        self.comidasPrediletas.append(contentsOf: comidas)
    }
    
    func imprimeIdade() {
        print("Sua idade eh \(self.idade)")
    }
    
    func imprimeListaDeComidas() {
        for comida in comidasPrediletas {
            print(comida)
        }
    }
    
}

var apresentacao = Apresentacao(nome: "victor", idade: 23, comidasPrediletas: [])

apresentacao.apresentacaoDoAluno()
apresentacao.adicionaComidaPredileta(["caju", "morango", "pera"])
apresentacao.imprimeListaDeComidas()
apresentacao.imprimeIdade()
apresentacao.fezAniversario()

print()
print()





//Desafio 2: Desenvolva um sistema bancário simples que permita aos clientes abrir uma conta, depositar dinheiro, sacar dinheiro e verificar o saldo. Crie classes para representar clientes, contas bancárias e transações.

print("Desafio 2")
print()
print()

class Cliente {
    
    var nome: String
    var cpf: String
    
    init(nome: String, cpf: String) {
        self.nome = nome
        self.cpf = cpf
    }
}

class Conta {
    
    var titular: Cliente
    var saldo: Double = 0
    var agencia: Int
    var numero: Int
    
    init(agencia: Int, numero: Int, titular: Cliente) {
        self.agencia = agencia
        self.numero = numero
        self.titular = titular
    }
    
    func saca(valor: Double){
        if(saldo < valor) {
            print("saldo insuficiente")
        }
        saldo -= valor
    }
    
    func deposita(valor: Double){
        self.saldo += valor
    }
    
    func transfere(valor: Double, destino: Conta) {
        if(saldo < valor) {
            print("saldo insuficiente")
        }
        saca(valor: valor)
        destino.deposita(valor: valor)
    }
    
}

var cliente1 = Cliente(nome: "victor", cpf: "2908458723")
var cliente2 = Cliente(nome: "hugo", cpf: "38471385432")

var conta1 = Conta(agencia: 2222, numero: 252525, titular: cliente1)
var conta2 = Conta(agencia: 3333, numero: 454545, titular: cliente2)

conta1.deposita(valor: 1250)
conta2.deposita(valor: 2000)

print(conta1.titular.nome)

print("conta 1 saldo: ", conta1.saldo)
print("conta 2 saldo: ", conta2.saldo)

conta1.saca(valor: 50)
print("conta 1 saldo depois de sacar: ", conta1.saldo)

conta1.deposita(valor: 100)
print("conta 1 saldo depois de depositar: ", conta1.saldo)

conta1.transfere(valor: 500, destino: conta2)
print("conta 1 saldo depois da transferencia: ", conta1.saldo)
print("conta 2 saldo depois da transferencia: ", conta2.saldo)


print()
print()


//Desafio 3: Desenvolva um sistema de reservas de voos que permita aos usuários procurar voos disponíveis, reservar voos, cancelar reservas e verificar informações de voo. Crie classes para representar voos, reservas e usuários.

print("Desafio 3")
print()
print()


var voosArmazenados:[Voo] = []
class Voo {
    
    var numeroDeVoos: Int = voosArmazenados.count
    var origem: String
    var destino: String
    var descricaoVoo:String
    
    init(origem: String, destino: String, descricaoVoo:String) {
        self.origem = origem
        self.destino = destino
        self.descricaoVoo = descricaoVoo
        voosArmazenados.append(self)
    }
}

class Reserva{
    var voo:Voo
    
    init(voo:Voo){
        self.voo = voo
    }
    
}

class Usuario {
    
    var nome: String
    private var reservas: [Reserva] = []
    
    init(nome: String) {
        self.nome = nome
    }
    
    func fazerReserva(voo:Voo){
           if voosArmazenados.count == 0{
               print("Sem voos disponíveis!")
           }else{
               reservas.append(Reserva(voo: voo))
        }
    }
       
    func cancelarReservas(numReserva:Int){
        reservas.remove(at: numReserva - 1)
    }
    
   func mostrarReservas(){
           for i in 0...reservas.count-1{
               print("Reserva de numero \(i+1): Voo para \(reservas[i].voo.destino)")
           }
           print("\n")
       }
       
       func mostrarVoos(){
           if voosArmazenados.count == 0{
               print("Sem voos disponíveis")
           } else{
               for i in 0...voosArmazenados.count-1{
                   print("Voo para \(voosArmazenados[i].destino)")
               }
               print("\n")
           }
       }
       
       func mostrarInformacoesVoos(voo:Voo){
           print(voo.descricaoVoo)
       }
    
}

var voo1 = Voo(origem: "Brasilia", destino: "Sao Paulo", descricaoVoo: "Viagem - Brasília - Sao Paulo às 13:00, dia: 30/12/2023")
var voo2 = Voo(origem: "Brasilia", destino: "Piaui", descricaoVoo: "Viagem - Brasília - Piaui às 14:30, dia: 25/06/2023")
var voo3 = Voo(origem: "Brasilia", destino: "Bahia", descricaoVoo: "Viagem - Brasília - Bahia às 03:00, dia: 30/10/2023")

var meuPerfil = Usuario(nome: "Victor Hugo")

meuPerfil.mostrarVoos()
meuPerfil.fazerReserva(voo: voo1)
meuPerfil.fazerReserva(voo: voo2)
meuPerfil.fazerReserva(voo: voo3)
meuPerfil.fazerReserva(voo: voo1)
meuPerfil.mostrarReservas()
meuPerfil.cancelarReservas(numReserva: 3)
meuPerfil.mostrarReservas()
meuPerfil.mostrarInformacoesVoos(voo: voo3)

