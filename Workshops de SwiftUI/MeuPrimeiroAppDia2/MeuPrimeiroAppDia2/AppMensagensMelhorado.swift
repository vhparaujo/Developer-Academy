//
//  AppMensagensMelhorado.swift
//  MeuPrimeiroAppDia2
//
//  Created by Victor Hugo Pacheco Araujo on 18/04/23.
//

import SwiftUI

struct cadaView: View {
  
  // constantes que armazenam as informacoes
  let data: String
  let codigo: String
  let mensagem: String
  
  var body: some View {
    
    HStack { // HStack que contem os icones do usuario, o codigo da mensagem, as mensagens
      // a data e o sino do nao perturbe
      Image(systemName: "person.circle.fill").resizable().frame(width: 50, height: 50).foregroundColor(Color .gray) // imagem do usuario
      
      VStack{ // VStack que abrange as mensagens, codigo, data e sino
        Divider() // cria a linha de divisao
        HStack{ // HStack abrange o codigo e a data
          
          Text(codigo).font(.system(size: 18)).bold()
          Spacer() // cria o espaco entre o codigo e a data
          Text(data).foregroundColor(Color.gray)
          
        }
        HStack{ // HStack do texto e sino
          if(codigo == "29468"){ // condicional para o caso de um lineLimit
            Text(mensagem).frame(maxWidth: .infinity).lineLimit(1)
            Spacer()
          } else {
            Text(mensagem).frame(maxWidth: .infinity).lineLimit(2)
            Spacer()
          }
          Image(systemName: "bell.slash").foregroundColor(Color.gray)
        }
      }
    }.padding([.bottom, .horizontal]) // padding para definir o tamanho da HStack que abrange tudo
  }
}

struct AppMensagensMelhorado: View {
    var body: some View {
      VStack{ // VStack da pagina inteira
        HStack{ // HStack dos icones superiores
          Image(systemName: "lessthan").foregroundColor(Color.blue)
          Text("Filters").foregroundColor(Color.blue)
          Spacer()
          Image(systemName: "ellipsis.circle").foregroundColor(Color.blue)
          Image(systemName: "square.and.pencil").foregroundColor(Color.blue)
        }.padding().frame(height: 30)
        
        HStack { // HStack do texto Messages
          Text("Messages").font(.system(size: 36)).bold()
          Spacer()
        }.padding().frame(height: 50)
        
        HStack{ // HStack da caixa de pesquisa
          Image(systemName: "magnifyingglass")
            .padding()
          Text("Search").foregroundColor(Color.gray)
          Spacer()
        }.frame(width: 350,height: 30)
          .background(Color(red: 0.201, green: 0.205, blue: 0.208, opacity: 0.255)).cornerRadius(10)
        
        ScrollView{ // Scroll
          ForEach(1...10, id: \.self){_ in // forEach para imprimir as 3 caixas de texto
            // mais de uma vez
            
            // chamada da struct que contem o codigo de cada mensagem como um todo
            cadaView.init(data: "Saturday >", codigo: "29738", mensagem: "Peca seu Cartao Atacadao novamente em atacadao.cc/3Gd8zmP. Seu credito")
            cadaView.init(data: "Thursday  >", codigo: "29468", mensagem: "842 638 is your Instagram code. Don't share it.")
            cadaView.init(data: "18/04/2023", codigo: "VIVO", mensagem: "Venha conferir a temporada 1 de Sucession, que conta sobre uma fami...")
          }
        }
    }
  }
}

struct AppMensagensMelhorado_Previews: PreviewProvider {
    static var previews: some View {
        AppMensagensMelhorado()
    }
}
