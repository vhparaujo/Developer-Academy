//
//  ContentView.swift
//  TesteAPI
//
//  Created by Victor Hugo Pacheco Araujo on 10/05/23.
//

import SwiftUI

struct ContentView: View {
  
  var body: some View {
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
      
    }.accentColor(Color("laranja"))
    
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
