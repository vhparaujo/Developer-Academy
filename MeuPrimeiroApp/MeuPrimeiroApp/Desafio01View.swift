//
//  Desafio01View.swift
//  MeuPrimeiroApp
//
//  Created by Victor Hugo Pacheco Araujo on 14/04/23.
//

import SwiftUI

class Aluno {
    
    var nome:String
    var numeroDoKit: Int
    
    init(nome: String, numeroDoKit: Int) {
        self.nome = nome
        self.numeroDoKit = numeroDoKit
    }
    
}

var aluno = Aluno(nome: "Victor Hugo", numeroDoKit: 639)

struct Desafio01View: View {
    var body: some View {
        VStack{
            Text("Exercicio")
            
            HStack{
                Rectangle()
                Rectangle()
                Rectangle()
            }
            
            Rectangle().frame(height: 100)
            Rectangle().frame(height: 100)
            Rectangle().frame(height: 100)
          
            HStack{
                Text("Estudante: ")
                
                VStack {
                    Text(String(aluno.numeroDoKit))
                    Text(aluno.nome)
                }
                
                Text("Eu consegui!")
            }
            
        }.padding()
    }
}

struct Desafio01View_Previews: PreviewProvider {
    static var previews: some View {
        Desafio01View()
    }
}
