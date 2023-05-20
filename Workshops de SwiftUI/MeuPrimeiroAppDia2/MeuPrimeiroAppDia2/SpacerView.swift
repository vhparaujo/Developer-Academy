//
//  ContentView.swift
//  MeuPrimeiroAppDia2
//
//  Created by Victor Hugo Pacheco Araujo on 17/04/23.
//

import SwiftUI

struct SpacerView: View {
    var body: some View {
        
        VStack {
//
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Spacer()
            HStack{
                Text("Desafio").frame(minWidth: 0, maxWidth: 100)
                Spacer()
            }
            //Spacer() // preenche todo o espaco nao utilizado
        }
        
        
        .background(Color(.systemBlue))
        .border(.pink)
        .padding()
    }
}

struct SpacerView_Previews: PreviewProvider {
    static var previews: some View {
        SpacerView()
    }
}
