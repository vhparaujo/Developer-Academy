//
//  TestandoToogle.swift
//  MeuPrimeiroAppDia2
//
//  Created by Victor Hugo Pacheco Araujo on 19/04/23.
//

import SwiftUI

struct TestandoToogle: View {
  @State var estaLigado = false
  @State var valorSlider = 100.0 // so recebe double
  
    var body: some View {
      
      VStack{
      
          Circle().frame(width: valorSlider).foregroundColor(estaLigado == false ? .red : .blue)
          Toggle(isOn: $estaLigado){
            Text("Meu toogle")
          }.padding()
        
          Slider(value: $valorSlider, in: 100...1000, step: 5)
          Text("Valor Slider: \(valorSlider)")
      }
    }
}

struct TestandoToogle_Previews: PreviewProvider {
    static var previews: some View {
        TestandoToogle()
    }
}
