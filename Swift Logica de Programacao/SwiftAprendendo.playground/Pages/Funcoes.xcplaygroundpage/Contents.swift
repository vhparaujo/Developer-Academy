import UIKit

let data = Date() // Date() traz a data atual do momento
print(data)

// funcao para retornar valor
func soma(a:Int, b:Int) -> Int {
    return a + b
}

// nao retorna valor
func soma(){
}

print(soma(a:10,b:10))

// desafio 1 funcoes
//Desafio: Utilizando funcoes, crie um programa capaz de retornar a sua idade atual. Para isso, sua funcao deve receber dois parametros (ano de nascimento e ano atual) e calcular o resultado.
/*
func idade(anoNascimento: Int, anoAtual: Int) -> Int {
    return anoAtual - anoNascimento
}

print(idade(anoNascimento:2002,anoAtual:2023))
*/

// desafio 1 implementacao do Antonio
// Declaramos a nossa funcao calculaIdade
func calculaIdade(dataDeNascimento: Date) -> (anos: Int, meses: Int, dias: Int) {

    // Criamos a constante calendario para receber um componente do tipo Calendar, que vai nos apoiar na hora de calcular a diferença entre as datas
    let calendario = Calendar.current

    // Criamos a constante dataAtual para receber a data atual da classe Date()
    let dataAtual = Date()

    // Criamos uma constante chamada idade, que vai receber o resultado em dias, meses e anos da diferença entre as datas de nascimento e data atual
    let idade = calendario.dateComponents([.year, .month, .day], from: dataDeNascimento, to: dataAtual)

    // Tratamos com o Coalesce o retorno do dateComponents que foi atribuido a constante idade
    let anos = idade.year ?? 0
    let meses = idade.month ?? 0
    let dias = idade.day ?? 0

    // Retornando os dias, meses e anos de diferença entre as datas calculadas
    return (anos, meses, dias)
}

// Criamos uma constante dateFormatter para receber um padrão de formatação amigável de data, no caso o padrão pt-BR de formatação de datas
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd/MM/yyyy"

// Atribuimos uma data de nascimento no padrão pt-BR para a constante dataDeNascimento
let dataDeNascimento = dateFormatter.date(from: "30/10/2002")!

// Chamamos a função calculaIdade passando a data de nascimento que criamos acima
let idade = calculaIdade(dataDeNascimento: dataDeNascimento)

// Printamos o resultado do calculo realizado na função, acessando a constante idade e os valores de dias, meses e anos que foram calculados
print("A idade da pessoa é: \(idade.anos) anos, \(idade.meses) meses e \(idade.dias) dias")


// desafio 2
//Desafio: Implemente um programa que contenha uma função que receba um parâmetro nota e retorne se o estudante foi aprovado ou não. A média para receber aprovação deve ser maior ou igual a 7.
func aprovacao(nota:Double) -> Double {
    var n = nota
    
        if(n < 0) {
            print("Nota nao possivel")
        }else if(n < 7){
            print("Reprovado")
        }else if(n <= 10){
            print("Aprovado")
        } else {
            print("Nota nao possivel")
        }
    
    return nota
}

print(aprovacao(nota: 7))


// Desafio 3
//Desafio: Implemente um programa que calcule a média de um conjunto de valores programa deve conter uma função que receba uma coleção de números como  parâmetro
//e retorne a média dos valores.
func mediaColecao(valores: Array<Float>) -> Float {
    // reduce() faz a soma dos elementos dentro de um array
    return valores.reduce(0, +) / Float(valores.count)
}

print(mediaColecao(valores: [2.0,7.8,8.5,4.5]))


// desafio 4
//Desafio: Implemente um programa que identifica se um número é par ou não. Este programa deve conter uma função que recebe um número inteiro como parâmetro realize a identificação do número.

// O _ na linha abaixo dentro do parametro da funcao retira a necessidade de escrever o rotulo
// da funcao na chamada da funcao
func parOuImpar(_ n: Int) -> String {
    if (n % 2 == 0) {
        return "O numero \(n) eh par"
    } else {
        return "O numero \(n) eh impar"
    }
}

print(parOuImpar(4))
