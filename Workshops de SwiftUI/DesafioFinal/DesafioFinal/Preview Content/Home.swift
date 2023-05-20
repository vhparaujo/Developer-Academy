//
//  ContentView.swift
//  DesafioFinal
//
//  Created by Victor Hugo Pacheco Araujo on 20/04/23.
//
import SwiftUI

struct Home: View {
  @State var favorito: Bool = false
  var body: some View {
    NavigationView {
      List{
        HStack{
          Text("Filtrar favoritos")
          // toggle do botao favorito
          Toggle(isOn: $favorito){
          }
        }
        // chamo a struct de informacoes pessoais que tem todas as informacoes e monta a lista de players
        InformacoesPessoais(favoritoOn: $favorito)
      }
      .navigationTitle("Tennis Players")
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
