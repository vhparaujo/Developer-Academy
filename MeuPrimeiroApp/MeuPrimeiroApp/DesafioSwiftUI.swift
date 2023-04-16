//
//  DesafioSwiftUI.swift
//  MeuPrimeiroApp
//
//  Created by Victor Hugo Pacheco Araujo on 14/04/23.
//

import SwiftUI

struct DesafioSwiftUI: View {
    var body: some View {
        VStack {
            Text("Minhas Formas")
            HStack {
                Circle()
                Text("Circulo")
                Rectangle()
                Text("Retangulo")
            }
            
            Rectangle().cornerRadius(10)
            //RoundedRectangle(cornerRadius: 10)
            Text("Retangulo com Bordas")
            Rectangle().frame(width: 150, height: 150)
            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
        
        }
        .padding()
    }
}

struct DesafioSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        DesafioSwiftUI()
    }
}
