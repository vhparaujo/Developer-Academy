//
//  ImagensJogadoresFlu.swift
//  MeuPrimeiroAppDia2
//
//  Created by Victor Hugo Pacheco Araujo on 18/04/23.
//

import SwiftUI

struct ImagensJogadoresFlu: View {
  
  let jogadores = Jogadores()
  let colunas = [GridItem(spacing: 5), GridItem(spacing: 5)]
  
  var body: some View {
    
    VStack{
      
      HStack{
        Circle()
          .fill()
          .foregroundColor(.white)
          .frame(width: 70, height: 70)
          .overlay() {
            Image("escudo")
              .resizable()
              .scaledToFit()
              .clipShape(Circle())
          }
        Spacer()
        
        Text("Fluminense Football Club").font(.system(size: 24))
      }.padding().background(.green)
      
      ScrollView{
        LazyVGrid(columns: colunas, spacing: 20){
          ForEach(jogadores.cadaJogador, id: \.id){ jogadores in
            Image(jogadores.imagem)
              .resizable()
              .scaledToFit()
              .cornerRadius(20)
            
          }
        }
      }
    }
  }
}

struct ImagensJogadoresFlu_Previews: PreviewProvider {
  static var previews: some View {
    ImagensJogadoresFlu()
  }
}
