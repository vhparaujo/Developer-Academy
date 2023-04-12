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

var opcao: Int = 3

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


