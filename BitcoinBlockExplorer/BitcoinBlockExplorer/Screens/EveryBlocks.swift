//
//  EveryBlocks.swift
//  TesteAPI
//
//  Created by Victor Hugo Pacheco Araujo on 16/05/23.
//

import SwiftUI

struct EveryBlocks: View {
  
  @StateObject var blockData = BlockDataEveryBlocks()
  @StateObject var validateAddresses = Validate()
  
  @State var timestamp: String = ""
  @State var numberTransactions: Int64 = 0
  @State var blockMiner: String = ""
  @State var medianFee: Double = 0
  @State var blockSize: Double = 0
  @State var heightBlock: Int = 0
  @State var hashBlock: String = ""
  
  // using the search
  @State var addressSearch: String = ""
  @State var idTransacaoSearch: String = ""
  @State var abrirModalAddress: Bool = false
  @State var abrirModalTransaction: Bool = false
  @State var abrirModal: Bool = false
  @State var idTransacaoButton: String = ""
  @State var searchText = ""
  
  let colunas = [GridItem(spacing: 5), GridItem(spacing: 5)]
  
  var body: some View {
    NavigationStack{
      VStack{
        ScrollView{
          
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
                }.onTapGesture {
                  hashBlock = blocks.id
                  heightBlock = blocks.height
                  medianFee = blocks.extras.medianFee
                  blockSize = blocks.size
                  blockMiner = blocks.extras.pool.name
                  numberTransactions = blocks.tx_count
                  timestamp = blocks.formatTimestampWithHour(blocks.timestamp)
                  abrirModal.toggle()
                }
              }
            }
          }
          
        }
      }.padding()
      
      // sheet of eachBlock
      .sheet(isPresented: $abrirModal) {
        EachBlock(timestamp: $timestamp,numberTransactions: $numberTransactions, blockMiner: $blockMiner, medianFee: $medianFee, blockSize: $blockSize, hashBlock: $hashBlock, heightBlock: $heightBlock, abrirModal: $abrirModal).presentationDetents([.height(650), .fraction(0.90)])
          .presentationBackground(Color("azul"))
      }
      
      // using the searchable and calling the .sheet EachTransaction here to make possible use the search too in this view
      .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Blocos, endereços ou transações") {
      }
      .onSubmit(of: .search) {
        //print(idTransacaoSearch) teste
        if validateAddresses.isValidAddress(searchText){
          addressSearch = searchText
          abrirModalAddress.toggle()
        } else {
          idTransacaoSearch = searchText
          abrirModalTransaction.toggle()
        }

      }
      .sheet(isPresented: $abrirModalAddress ) {
        EachAddress(addressSearch: $addressSearch, abrirModalAddress: $abrirModalAddress).presentationDetents([.height(650), .fraction(0.90)])
          .presentationBackground(Color("azul"))
      }
      .sheet(isPresented: $abrirModalTransaction) {
        EachTransaction(idTransacaoButton: $idTransacaoButton, idTransacaoSearch: $idTransacaoSearch, abrirModalTransaction: $abrirModalTransaction).presentationDetents([.height(650), .fraction(0.90)])
          .presentationBackground(Color("azul"))
      }

      .onAppear {
        blockData.fetch()
      }
      
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Image("bitcoin").resizable().frame(width: 30, height: 30)
        }
        ToolbarItem(placement: .principal) {
          Text("Bitcoin Blockchain Explorer").foregroundColor(Color("laranja")).font(.system(size: 20))
        }
      }
      .background(Color("azul"))
    }
  }
}

struct EveryBlocks_Previews: PreviewProvider {
  static var previews: some View {
    EveryBlocks()
  }
}
