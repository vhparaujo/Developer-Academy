//
//  ContentView.swift
//  MeuPrimeiroApp
//
//  Created by Victor Hugo Pacheco Araujo on 14/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("Testando SwiftUI!")
            Circle()
            Rectangle()
            Circle()
        }
        .padding()
    }
}

// serve para mostrar a tela no canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
