//**Desafio 1:**  Desenvolva um programa capaz de criar jogos para a loteria. O usuário deve ser capaz de informar qual é o tipo de jogo que ele quer gerar. A solução a ser desenvolvida deve gerar os seguintes jogos:
//
//Mega Sega - > 6 números aleatórios entre 1 e 60
//Lotomania -> 20 números aleatórios entre 0 e 99
//Lotofacil -> 15 números aleatórios entre 1 e 25
//Após gerar o jogo o computador vai gerar os numeros sorteados e o sistema deve informar quantos números o usuário acertou.

func loteria(qtdNumeros: Int, x: Int, y: Int) {
    
    // laco para sortear os numeros escolhidos
    var numero: Set<Int> = []
    while(numero.count < qtdNumeros){
        numero.insert(Int.random(in: x...y))
    }
    
    // laco para sortear os numeros sorteados
    var numero2: Set<Int> = []
    while(numero2.count < qtdNumeros){
        numero2.insert(Int.random(in: x...y))
    }
    
    // varredura dos dois Sets (arrays) para compara-los
    var j: Int = 0 // armazena a quantidade de numeros iguais
    for percorrerArray1 in numero {
        for percorrerArray2 in numero2 {
            if(percorrerArray1 == percorrerArray2) {
                j+=1
            }
        }
    }
    
    print("Numeros escolhidos: ")
    print(numero.sorted(by: <))
    print("Numeros sorteados: ")
    print(numero2.sorted(by: <), "\n")
    print("Voce acertou \(j) numeros")
    
}

var opcao: Int = 1

print("Selecione a opcao de jogo que voce deseja:\n")
print("1. Mega Sena\n2. Lotomania\n3. Lotofacil\n")

switch (opcao) {
case 1:
    print("Mega Sena:")
    loteria(qtdNumeros: 6, x: 1, y: 60)
case 2:
    print("Lotomania:")
    loteria(qtdNumeros: 20, x: 0, y: 99)
case 3:
    print("Lotofacil:")
    loteria(qtdNumeros: 15, x: 1, y: 25)
default:
    print("Opcao nao disponivel")
}


print("\n")




//**Desafio 2: **Implementar um jogo de Pedra, papel e tesoura. Um parâmetro deve ser informado pelo usuário, a escolha do computador deve ser gerada randomicamente, e o resultado final deve ser exibido para o usuário informando a escolha de cada um, além de informar quem ganhou.
//
//Regra:
//Papel vence a pedra;
//Pedra vence a tesoura;
//Tesoura vence o papel.

var jogo:[String:Int] = ["pedra":1,"tesoura":2, "papel":3]

func jogar(_ escolha: String){
    var resultadoInimigo = Int.random(in: 1...3)
    
    if resultadoInimigo == jogo[escolha]{
        print("Vocês empataram! Os dois escolheram \(escolha)")
    } else if resultadoInimigo == 1 && jogo[escolha] == 3 ||
                resultadoInimigo == 2 && jogo[escolha] == 1 ||
                resultadoInimigo == 3 && jogo[escolha] == 2
    {
        print("Você ganhou! Você escolheu \(escolha) e ele \((jogo.first(where: {$0.value == resultadoInimigo})?.key)!)")
    } else{
        print("Você perdeu! Você escolheu \(escolha) e ele \((jogo.first(where: {$0.value == resultadoInimigo})?.key)!)")
    }
    
}

jogar("pedra")

print()
print()


//**Desafio 3:** Você é um detetive tentando desvendar um crime. Para encontrar o assassino, você precisa descobrir a senha do cofre que contém a arma do crime. Crie um programa que gere uma senha aleatória de quatro dígitos (de 0 a 9). O jogador deve ter três tentativas para acertar a senha. A cada tentativa, o programa deve dizer quantos dígitos o jogador acertou e quantos deles estão na posição correta. Se o jogador não acertar a senha em três tentativas, o programa deve informar que o cofre está bloqueado e encerrar o jogo.
//
//Dicas:
//- Utilize uma função para gerar a senha aleatória.
//- Utilize a função de conversão de tipos de dados para transformar os números da senha e das tentativas em strings e compará-los.
//- Utilize um loop while para controlar as tentativas do jogador.
//- Utilize variáveis e condicionais para determinar quantos dígitos o jogador acertou e quantos deles estão na posição correta.
//- Utilize optionals para tratar o caso em que o jogador não acerta a senha em três tentativas.

func senhaAleatoria() {
    
    var tentativa: Int = 0
    
    while(tentativa < 3) {
        var senhaDoCofre: [Int] = []
        while(senhaDoCofre.count < 4) {
            senhaDoCofre.append(Int.random(in: 0...9))
        }
        
        print(senhaDoCofre)
        
        var senhaTentativa: [Int] = []
        while(senhaTentativa.count < 4) {
            senhaTentativa.append(Int.random(in: 0...9))
        }
        
        print(senhaTentativa)
        
        var i: Int = 0
        for elemento in senhaDoCofre {
            for elemento2 in senhaTentativa {
                if(elemento == elemento2){
                    i += 1
                }
            }
        }
        
        print("Voce acertou \(i) numeros da senha")
        
        var j: Int = 0
        for elemento in senhaDoCofre {
            if(elemento == senhaTentativa[j]){
                j += 1
            }
        }
        
        print("Dos \(i) que voce acertou \(j) estao na posicao correta")
        tentativa+=1
    }
    print("Voce tentou 3 vezes")
    
}

senhaAleatoria()


print()
print()



//**Desafio 4:** Escreva uma função que calcule a área de um triângulo retângulo. A função deve receber dois parâmetros, representando a base e a altura do triângulo, ambos como strings opcionais. Se um dos parâmetros não for fornecido, a função deve retornar nil. Além disso, a função deve verificar se os parâmetros fornecidos são valores numéricos. Se não forem, a função deve retornar nil. Por fim, a função deve imprimir o resultado da área calculada se tudo estiver correto, ou imprimir uma mensagem de erro caso contrário.

func areaTriangulo(base: String?, altura: String?) -> Double? {
    
    if let baseDesembrulhada = Double(base!) {
        if let alturaDesembrulhada = Double(altura!){
            return (baseDesembrulhada * alturaDesembrulhada)/2
        } else {
            return nil
        }
    } else {
        return nil
    }
    
}

let resultado = areaTriangulo(base: "5", altura: "4")

print("-------------\n\n")

if resultado != nil {
    print("Area do triangulo = ", resultado!)
} else {
    print("Erro")
}
