//
//  ImagensSwiftUI.swift
//  MeuPrimeiroAppDia2
//
//  Created by Victor Hugo Pacheco Araujo on 18/04/23.
//

import SwiftUI

struct ImagensSwiftUI: View {
  @Environment (\.colorScheme) var colorSystem
  var body: some View {
    
    VStack{
      
      Circle()
        .fill()
        .foregroundColor(.green)
        .overlay() {
          Image("cano")
            .resizable()
            .scaledToFit()
            .cornerRadius(50)
            .clipShape(Circle())
        }
      Text("Testando as cores").foregroundColor(colorSystem == .dark ? .yellow : .blue ).font(.system(size: 32))
      // if ternario para dark mode e light mode
      
    }
  }
}

struct ImagensSwiftUI_Previews: PreviewProvider {
  static var previews: some View {
    ImagensSwiftUI()
  }
}
