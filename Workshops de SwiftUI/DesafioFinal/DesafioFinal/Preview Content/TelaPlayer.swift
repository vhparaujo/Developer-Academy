//
//  telaDjoko.swift
//  DesafioFinal
//
//  Created by Victor Hugo Pacheco Araujo on 20/04/23.
//

import SwiftUI

// struct para mostrar a tela de cada jogador
struct TelaPlayer: View {
  @Binding var favoritado: Bool
  @Binding var dados: Players
  
  var body: some View {
    VStack {
      NavigationView{
        ScrollView{
          ZStack{
            VStack{
              // imagem do fundo na parte de cima
              Image(dados.imagemFundo).resizable().frame(width: .infinity, height: 300)
              Spacer(minLength: 100)
            }
            VStack{
              Spacer()
              // foto do jogador na forma circular
              Image(dados.imagemLista)
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(5)
                .clipShape(Circle())
                .shadow(color: .black, radius: 5)
            }
          }
          
          HStack{
            Text(dados.nome).foregroundColor(.black).font(.system(size: 24))
              .padding(.leading)
            Spacer()
            Button{
              // botao do favorito
              favoritado.toggle()
            } label: {
              // imagem da estrelinha de favorito, faz verificacao do favorito
              Image(systemName: "\(favoritado == false ? "star" : "star.fill")").foregroundColor(.yellow)
            }.padding().frame(height: 20)
          }
          
          HStack{
            // ranking do jogador
            Text(dados.ranking).font(.system(size: 14))
            Spacer()
            Text("ATP").font(.system(size: 16))
          }.padding().frame(height: 20)
          
          Divider().frame(width: 350)
          
          HStack{
            // titulo biografia do jogador
            Text(dados.tituloBiografia)
            Spacer()
          }.padding()
          
          // biografia do jogador
          Text(dados.biografia).padding()
        }
        // mostra o nome do jogador no navigation
        //.navigationTitle(dados.nome)
      }
    }
  }
}
