//
//  ButtonView.swift
//  MeuPrimeiroAppDia2
//
//  Created by Victor Hugo Pacheco Araujo on 20/04/23.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
      NavigationView{
        VStack{
          let a:Int = 26
          let b:Int = 45
          let resultado: Int = a * b
          Button { // acao do botao
            print("Valor da multiplicacao \(a) * \(b) = \(String(resultado))")
          } label: { // aparencia do botao
            ZStack{
              Circle().frame(width: 300, height: 200)
              Text("Botao").foregroundColor(Color.red).font(.system(size: 38)).bold()
            }
          }
          Text("Valor da multiplicacao \(a) * \(b) = \(String(resultado))").font(.system(size: 18)).bold()
          NavigationLink {
            Tela2()
          } label: {
            Text("Pagina 2").font(.system(size: 38))
          }
        }
      }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
