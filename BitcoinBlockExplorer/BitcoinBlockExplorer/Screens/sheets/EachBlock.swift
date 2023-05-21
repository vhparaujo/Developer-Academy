//
//  EachBlock.swift
//  TesteAPI
//
//  Created by Victor Hugo Pacheco Araujo on 17/05/23.
//

import SwiftUI

struct EachBlock: View{

  @Binding var abrirModal: Bool
  @Binding var hashBlock: String
  @Binding var heightBlock: Int
  @StateObject var blockData = BlockDataHome()
  @StateObject var blockTransactionData = BlockTransactionsData()
  
  var body: some View {
    VStack{
      ScrollView{
        
        HStack{
          Text("Bloco").foregroundColor(Color("cinza")).offset(y: 15)
          
        
          Button{
            print(blockData)
          } label: {
            Circle()
              .fill()
              .foregroundColor(Color("cinza"))
              .frame(width: 30, height: 30)
              .overlay() {
                Text("X").clipShape(Circle())
              }
          }
          
        }
        
        ForEach(blockData.blockDatas, id: \.self) { blocks in
          HStack{
            ZStack{
              RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 147,height: 40)
              HStack{
                Text("Bloco").foregroundColor(Color("cinza")).font(.system(size: 15))
                Text("\(heightBlock)").foregroundColor(Color("cinza")).font(.system(size: 15))
              }
            }
            
            Spacer()
          }.padding()
          
          ZStack{
            RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 358,height: 40)
            HStack{
              Text("Hash").foregroundColor(Color("cinza")).font(.system(size: 15))
              Text("\(String(hashBlock.prefix(30)))").foregroundColor(Color("laranja")).font(.system(size: 15))
            }
          }
          
          ZStack{
            RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 358,height: 192)
            VStack{
              
              HStack{
                Text("Data/Hora").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: 30)
                Spacer()
                Text("\(blocks.formatTimestampWithHour(blocks.timestamp))").foregroundColor(Color("laranja")).font(.system(size: 15)).offset(x: -30)
               
              }
              
              Divider().frame(width: 350)
              
              HStack{
                Text("Tamanho").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: -68)
                Text("\(blocks.size)").foregroundColor(Color("laranja")).font(.system(size: 15)).offset(x: 68)
              }
              
              Divider().frame(width: 350)
              
              HStack{
                Text("Taxa mediana").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: -75)
                Text("\(blocks.extras.medianFee)").foregroundColor(Color("laranja")).font(.system(size: 15)).offset(x: 75)
              }
              
              Divider().frame(width: 350)
              
              HStack{
                Text("Minerador").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: 30)
                Spacer()
                Text("\(blocks.extras.pool.name)").foregroundColor(Color("laranja")).font(.system(size: 15)).offset(x: -30)
              }
              
            }
          }
          
          HStack{
            Text("\(blocks.tx_count) transações").foregroundColor(Color("cinza")).font(.system(size: 15))
            Spacer()
            Image(systemName: "chevron.left").foregroundColor(Color("cinza"))
            Image(systemName: "chevron.right").foregroundColor(Color("cinza"))
            
          }.padding()
        }
        
        
        ForEach(blockTransactionData.blockTransactionsData, id: \.self) { blocksT in
          ZStack{
            RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 358,height: 121)
            VStack{
              
              HStack{
                Text("\(String(blocksT.txid.prefix(30)))").foregroundColor(Color("laranja")).font(.system(size: 12))
                Spacer()
                
                Text("\(blocksT.status.formatTime(blocksT.status.block_time))").foregroundColor(Color("cinza")).font(.system(size: 12))
              }.padding()
              
//              VStack{
//                Text("\(blocksT.vin[0].prevout.scriptpubkey_address)").foregroundColor(Color("cinza")).font(.system(size: 12))
//                Text("\(blocksT.vin[0].prevout.value / 100000000) BTC").foregroundColor(Color("cinza")).font(.system(size: 12))
//              }
              
            }
          }
        }
        
      }
    }.onAppear() {
      blockData.fetch(1)
//      transaction
//        .getEachTransactionInfo()
      blockTransactionData.getEachBlocksInfo(hashBlock)
    }
    
    
  }
}
