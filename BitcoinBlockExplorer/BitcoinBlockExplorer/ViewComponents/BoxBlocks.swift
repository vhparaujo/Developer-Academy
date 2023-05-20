//
//  BoxBlocks.swift
//  BitcoinBlockExplorer
//
//  Created by Victor Hugo Pacheco Araujo on 18/05/23.
//

import SwiftUI

struct BoxBlocks: View {
  @StateObject var blockData = BlockDataHome()
  @State var abrirModal: Bool = false
  let colunas = [GridItem(spacing: 5), GridItem(spacing: 5)]
  
  var body: some View {
    VStack{
      HStack {
        Text("Bloco").foregroundColor(Color("cinza")).font(.system(size: 17))
        Spacer()
      }.padding()
      LazyVGrid(columns: colunas, spacing: 20) {
        ForEach(blockData.blockDatas, id: \.self) { blocks in
          
          Button{
            abrirModal.toggle()
          } label: {
            ZStack{
              RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 160,height: 109)
              VStack{
                let tamanho = String(format: "%.2f", (blocks.size / 1000000))
                
                Text("\(blocks.height)").foregroundColor(Color("laranja")).font(.system(size: 15))
                Text("~\(Int(blocks.extras.medianFee)) sat/vB").foregroundColor(Color("cinza")).font(.system(size: 12))
                Text("\(tamanho) MB").foregroundColor(Color("cinza")).font(.system(size: 12))
                Text("\(blocks.tx_count) transações").foregroundColor(Color("cinza")).font(.system(size: 12))
                Text("\(blocks.formatTimestamp(blocks.timestamp))").foregroundColor(Color("cinza")).font(.system(size: 12))
              }
            }
          }
          
        }
      }
    }.sheet(isPresented: $abrirModal) {
      EachBlock(abrirModal: $abrirModal).presentationDetents([.height(650), .fraction(0.90)])
        .presentationBackground(Color("azul"))
      }
    .onAppear() {
      blockData.fetch(4)
    }
    
  }
}

struct BoxBlocks_Previews: PreviewProvider {
  static var previews: some View {
    BoxBlocks().environment(\.colorScheme, .dark)
      .environment(\.colorScheme, .light)
  }
}
