//
//  ButtonLibrary.swift
//  BotoesEmSwiftUI
//
//  Created by Victor Hugo Pacheco Araujo on 19/04/23.
//

import SwiftUI

struct botaoPrincipal: View{
  var body: some View {
    Button { // acao do botao
      print("Botao Principal")
    } label: { // aparencia do botao
      ZStack{
        Rectangle().cornerRadius(40).frame(width: 250, height: 70)
        Text("Botao Principal").foregroundColor(Color.white).font(.system(size: 20))
      }
    }
  }
}

struct botaoSecundario: View{
  var body: some View {
    Button { // acao do botao
      print("Botao Secundario")
    } label: { // aparencia do botao
      ZStack{
        Rectangle().frame(width: 200, height: 70).foregroundColor(.white).border(Color.blue)
        Text("Botao Secundario").foregroundColor(Color.blue).font(.system(size: 20))
      }
    }
  }
}

struct cancelar: View{
  var body: some View {
    Button { // acao do botao
      print("Cancelar")
    } label: { // aparencia do botao
      ZStack{
        Rectangle().frame(width: 300, height: 70).foregroundColor(.red)
        Text("Cancelar").foregroundColor(Color.white).font(.system(size: 20))
      }
    }
  }
}

struct aceitar: View{
  var body: some View {
    Button { // acao do botao
      print("Aceitar")
    } label: { // aparencia do botao
      ZStack{
        Rectangle().frame(width: 300, height: 70).foregroundColor(.green)
        Text("Aceitar").foregroundColor(Color.white).font(.system(size: 20))
      }
    }
  }
}


struct ButtonLibrary: View {
  var body: some View {
    VStack{
      botaoPrincipal()
      botaoSecundario()
      cancelar()
      aceitar()
    }
  }
}

struct ButtonLibrary_Previews: PreviewProvider {
  static var previews: some View {
    ButtonLibrary()
  }
}
