//
//  DesafioImagem.swift
//  MeuPrimeiroAppDia2
//
//  Created by Victor Hugo Pacheco Araujo on 18/04/23.
//

import SwiftUI

struct DesafioImagem: View {
  
  let arrayImagens: [String] = []
  
  var body: some View {
    VStack {
      HStack{
        ZStack{
          Circle().frame(width: 60, height: 60)
          Image(systemName: "star.fill").resizable().colorInvert().frame(width: 25, height: 25)
        }
        Text("Meu perfil").font(.system(size: 18))
        Spacer()
      }
      Divider().frame(height: 5)
        .background(Color.blue)
      
      VStack{
        ScrollView{
          ForEach(1...20, id: \.self){ _ in
            Spacer()
            Image("cano")
              .resizable()
              .scaledToFit()
              .cornerRadius(20)
            Spacer()
          }
        }
      }
      
      HStack{
        Text("Texto no rodape").font(.system(size: 24))
        Spacer()
      }
    }.padding()
  }
}

struct DesafioImagem_Previews: PreviewProvider {
  static var previews: some View {
    DesafioImagem()
  }
}
