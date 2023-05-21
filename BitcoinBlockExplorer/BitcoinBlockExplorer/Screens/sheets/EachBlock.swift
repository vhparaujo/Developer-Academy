//
//  EachBlock.swift
//  TesteAPI
//
//  Created by Victor Hugo Pacheco Araujo on 17/05/23.
//

import SwiftUI

struct EachBlock: View{
  @Binding var timestamp: String
  @Binding var numberTransactions: Int64
  @Binding var blockMiner: String
  @Binding var medianFee: Double
  @Binding var blockSize: Double
  @Binding var hashBlock: String
  @Binding var heightBlock: Int
  @Binding var abrirModal: Bool
  @StateObject var blockTransactionData = BlockTransactionsData()
  
  var body: some View {
    VStack{
      ScrollView{
        
        HStack{
          Text("Bloco").foregroundColor(Color("cinza")).offset(y: 15)
          
          
          Button{
            abrirModal.toggle()
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
              Text("\(timestamp)").foregroundColor(Color("laranja")).font(.system(size: 15)).offset(x: -30)
              
            }
            
            Divider().frame(width: 350)
            
            HStack{
              Text("Tamanho").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: -68)
              Text("\(blockSize)").foregroundColor(Color("laranja")).font(.system(size: 15)).offset(x: 68)
            }
            
            Divider().frame(width: 350)
            
            HStack{
              Text("Taxa mediana").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: -75)
              Text("\(medianFee)").foregroundColor(Color("laranja")).font(.system(size: 15)).offset(x: 75)
            }
            
            Divider().frame(width: 350)
            
            HStack{
              Text("Minerador").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: 30)
              Spacer()
              Text("\(blockMiner)").foregroundColor(Color("laranja")).font(.system(size: 15)).offset(x: -30)
            }
            
          }
          
          
        }
        
        HStack{
          Text("\(numberTransactions) transações").foregroundColor(Color("cinza")).font(.system(size: 15))
          Spacer()
          Image(systemName: "chevron.left").foregroundColor(Color("cinza"))
          Image(systemName: "chevron.right").foregroundColor(Color("cinza"))
          
        }.padding()
        
        
        ForEach(blockTransactionData.blockTransactionsData, id: \.self) { blocksT in
          ZStack{
            RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 358,height: 121)
            VStack{
              
              HStack{
                Text("\(String(blocksT.txid.prefix(30)))").foregroundColor(Color("laranja")).font(.system(size: 12))
                Spacer()
                
                Text("\(blocksT.status.formatTime(blocksT.status.block_time))").foregroundColor(Color("cinza")).font(.system(size: 12))
              }.padding()
              
              
              HStack{
                VStack{
                  ForEach(blocksT.vin, id: \.self) { vin in
                    if let prevoutDesembrulhado: Prevout = vin.prevout {
                      Text(prevoutDesembrulhado.scriptpubkey_address).foregroundColor(Color("cinza")).font(.system(size: 12))
                      Text("\(prevoutDesembrulhado.value / 100000000) BTC").foregroundColor(Color("cinza")).font(.system(size: 12))
                    } else {
                      Text("Coinbase").foregroundColor(Color("cinza")).font(.system(size: 12))
                    }
                  }
                }
                
                VStack {
                  ForEach(blocksT.vout.indices, id: \.self) { index in
                    if let scriptpubkey_address = blocksT.vout[index].scriptpubkey_address {
                      Text(scriptpubkey_address)
                        .foregroundColor(Color("cinza"))
                        .font(.system(size: 12))
                    } else {
                      Text("Coinbase")
                        .foregroundColor(Color("cinza"))
                        .font(.system(size: 12))
                    }
                    
                    
                    Text("\(blocksT.vout[index].value / 100000000) BTC")
                      .foregroundColor(Color("cinza"))
                      .font(.system(size: 12))
                    
                  }
                }
                
              }
              
            }
          }
        }
        
      }
    }.onAppear() {
      blockTransactionData.getEachBlocksInfo(hashBlock)
    }
    
    
  }
}
