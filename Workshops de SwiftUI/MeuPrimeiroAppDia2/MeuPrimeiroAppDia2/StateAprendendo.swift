//
//  State.swift
//  MeuPrimeiroAppDia2
//
//  Created by Victor Hugo Pacheco Araujo on 19/04/23.
//

import SwiftUI

struct StateAprendendo: View {
  @State var texto: String = ""
  @State var abrirModal: Bool = false
  
  var body: some View {
    VStack{
      
//      Button{
//        contador+=1
//      } label: {
//        Text("Teste")
//      }
      Spacer()
        Text(texto)
      Button{
        abrirModal.toggle()
      } label: {
        ZStack{
          RoundedRectangle(cornerRadius: 20).frame(width: 250, height: 60)
          Text("Abrir modal").foregroundColor(Color.white)
        }
      }
      
    }.sheet(isPresented: $abrirModal) {
      modal(abrirModal: $abrirModal, texto: $texto)
    }
  }
}

struct modal: View{
  @Binding var abrirModal: Bool
  @Binding var texto: String
  
  var body: some View {
    TextField("Digite algo: ", text: $texto).textFieldStyle(.roundedBorder).frame(width: 350)
    
    Button{
      abrirModal.toggle()
    } label: {
      Text("Fechar")
    }
  }
}

struct State_Previews: PreviewProvider {
    static var previews: some View {
        StateAprendendo()
    }
}
