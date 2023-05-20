//
//  TabView.swift
//  MeuPrimeiroAppDia2
//
//  Created by Victor Hugo Pacheco Araujo on 18/04/23.
//

import SwiftUI

struct TabView2: View {
    var body: some View {
      VStack{
        TabView {
          ImagensSwiftUI()
            .tabItem {
              Label("Imagens", systemImage: "paintbrush")
            }
          
          DesafioImagem()
            .tabItem {
              Label("Desafio Imagem", systemImage: "paintbrush")
            }
          
          ImagensJogadoresFlu()
            .tabItem {
              Label("Jogadores Do Flu", systemImage: "paintbrush")
            }
        }
      }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView2()
    }
}
