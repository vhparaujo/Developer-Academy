//
//  DividerView.swift
//  MeuPrimeiroAppDia2
//
//  Created by Victor Hugo Pacheco Araujo on 17/04/23.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        VStack {
            Text("Meu perfil")
            Divider().frame(height: 10)
                .background(Color.blue)
                //.overlay(Color.blue)
            Spacer()
        }.padding()
    }
}

struct DividerView_Previews: PreviewProvider {
    static var previews: some View {
        DividerView()
    }
}
