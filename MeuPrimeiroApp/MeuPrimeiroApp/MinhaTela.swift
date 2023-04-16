//
//  MinhaTela.swift
//  MeuPrimeiroApp
//
//  Created by Victor Hugo Pacheco Araujo on 14/04/23.
//

import SwiftUI

struct MinhaTela: View {
    var body: some View {
        VStack {
            
            HStack{
                
                Rectangle().frame(width: 200, height: 200)
                Text("Quadrado")
            
            }
            
            Rectangle().hueRotation(Angle(degrees: 90)).frame(width: 100, height: 200)
        
            Path {
                
                path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 0))
                path.addLine(to: CGPoint(x: 0, y: 100))
    
            }.fill(Color.green)
        }
        .padding()
    }
}

struct MinhaTela_Previews: PreviewProvider {
    static var previews: some View {
        MinhaTela()
    }
}
