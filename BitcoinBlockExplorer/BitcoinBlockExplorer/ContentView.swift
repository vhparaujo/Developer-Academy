//
//  ContentView.swift
//  TesteAPI
//
//  Created by Victor Hugo Pacheco Araujo on 10/05/23.
//

import SwiftUI

struct ContentView: View {
  
  @State var idTransacaoSearch: String = ""
  @State var abrirModal: Bool = false
  @State var idTransacaoButton: String = ""
  @State var searchText = ""
  
  var body: some View {
    NavigationStack{
      VStack{
        TabView{
          Home().tabItem {
            Label("Home", systemImage: "house")
          }
          EveryBlocks().tabItem {
            Label("Blocos", systemImage: "cube")
          }
          EveryTransactions().tabItem {
            Label("Transações", systemImage: "rectangle.grid.1x2.fill")
          }
          
        }
        
      }.accentColor(Color("laranja"))
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Blocos, endereços ou transações") {
        }
        .onSubmit(of: .search) {
          idTransacaoSearch = searchText
          //print(idTransacaoSearch) teste
          abrirModal.toggle()
        }.sheet(isPresented: $abrirModal) {
          EachTransaction(idTransacaoButton: $idTransacaoButton, idTransacaoSearch: $idTransacaoSearch, abrirModal: $abrirModal).presentationDetents([.height(650), .fraction(0.90)])
            .presentationBackground(Color("azul"))
        }
    }
    
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(idTransacaoSearch: "id")
  }
}
