//
//  TextLibrary.swift
//  BotoesEmSwiftUI
//
//  Created by Victor Hugo Pacheco Araujo on 18/04/23.
//

import SwiftUI

struct titulo: View{
  var body: some View {
    Text("Título").foregroundColor(Color.red).bold().font(.system(size: 32))
  }
}

struct subTitulo: View{
  var body: some View {
    Text("Sub-Titulo").foregroundColor(Color.green).bold().font(.system(size: 24))
  }
}

struct corpo: View{
  var body: some View {
    Text("Corpo do texto").foregroundColor(Color.blue).bold().font(.system(size: 18))
  }
}

struct citacao: View{
  var body: some View {
    Text("Artigo para aprender sobre view").foregroundColor(Color.gray).font(.system(size: 12))
  }
}

struct TextLibrary: View {
    var body: some View {
      VStack{
        titulo()
        subTitulo()
        corpo()
        citacao()
      }
    }
}

struct TextLibrary_Previews: PreviewProvider {
    static var previews: some View {
        TextLibrary()
    }
}
