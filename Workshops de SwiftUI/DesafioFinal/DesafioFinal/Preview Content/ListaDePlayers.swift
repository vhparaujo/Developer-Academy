//
//  jogador.swift
//  DesafioFinal
//
//  Created by Victor Hugo Pacheco Araujo on 20/04/23.
//

import SwiftUI

// struct que mostra a lista de players na home
struct ListaDePlayers: View {
  // favoritado que vem de Informacoes Pessoais
  @Binding var favoritado: Bool
  // dados eh binding para permitir mudar os dados em ambas as telas
  @Binding var dados: Players
  
  var body: some View {
    NavigationLink{
      // NavigationLink para levar a TelaPlayer
      TelaPlayer(favoritado: $favoritado, dados: $dados)
    } label: {
      HStack{
        // foto do jogador
        Image(dados.imagemLista).resizable().frame(width: 50, height: 50)
        VStack{
          HStack{
            // nome do jogador
            Text(dados.nome).font(.system(size: 20))
            Spacer()
            // imagem da estrelinha
            Image(systemName: "\(favoritado == false ? "" : "star.fill")").foregroundColor(.yellow)
          }
        }
      }
    }
  }
}
