//
//  EachTransaction.swift
//  BitcoinBlockExplorer
//
//  Created by Victor Hugo Pacheco Araujo on 18/05/23.
//

import SwiftUI

struct EachTransaction: View {
  @StateObject var transaction = EachTransactionData()
  @Binding var idTransacao: String
  @Binding var abrirModal: Bool
  
  var body: some View {
    VStack{
      ScrollView{
        
       HStack{
         Spacer()
         Text("Transação").foregroundColor(Color("cinza")).offset(x: 15, y: 15)
         
         Spacer()
         Button{
           abrirModal.toggle()
         } label: {
           Circle()
             .fill()
             .foregroundColor(Color("cinza"))
             .frame(width: 30, height: 30)
             .overlay() {
               Text("X").clipShape(Circle()).font(.system(size: 20)).foregroundColor(Color("laranja"))
             }.offset(x: -10, y: 15)
         }
         
       }
          
        ZStack{
          RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 358,height: 40)
          HStack{
            Text("Transação").foregroundColor(Color("cinza")).font(.system(size: 15))
            Text("\(String(idTransacao.prefix(30)))").foregroundColor(Color("laranja")).font(.system(size: 15))
          }
        }.offset(y: 25)
        
        ForEach(transaction.eachTransactionDatas, id: \.self) { transactions in
        
          HStack{
            
        
              HStack{
                if let blockHeightDesembrulhado = transactions.status.block_height {
                  ZStack{
                    RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 147,height: 40)
                    Text("Bloco").foregroundColor(Color("cinza")).font(.system(size: 15))
                    Text("\(blockHeightDesembrulhado)").foregroundColor(Color("cinza")).font(.system(size: 15))
                  }
                } else {
                    
                  }
                
              }
            
            
            Spacer()
            
            ZStack{
              RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 147,height: 40)
              HStack{
                if(transactions.status.confirmed == true) {
                  Text("Confirmada").foregroundColor(Color("cinza")).font(.system(size: 15))
                } else {
                  Text("Não confirmada").foregroundColor(Color("cinza")).font(.system(size: 15))
                }
              }
            }
            
          }.padding()
          
          ZStack{
            RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 358,height: 192)
            VStack{
              
              HStack{
                Text("Data/Hora").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: 30)
                Spacer()
                if let blockTimeDesembrulhado = transactions.status.block_time, let formattedTime = transactions.status.formatTime(blockTimeDesembrulhado) {
                  Text("\(formattedTime)").foregroundColor(Color("cinza")).font(.system(size: 15))
                } else {
                  Text("Aguardando confirmação").foregroundColor(Color("cinza")).font(.system(size: 15))
                }
              }
              
              Divider().frame(width: 350)
              
              HStack{
                Text("Tamanho").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: -80)
                Text("\(transactions.size) B").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: 80)
              }
              
              Divider().frame(width: 350)
              
              HStack{
                Text("Taxa ").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: -85)
                Text("\(transactions.fee / 100000000) BTC").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: 75)
              }
            }
            
          }
          
          HStack{
            Text("Entrada e Saídas").foregroundColor(Color("cinza")).font(.system(size: 15))
            Spacer()
          }.padding()
          
          ZStack{
            
            RoundedRectangle(cornerRadius: 7).fill()
              .foregroundColor(Color("caixas"))
              .frame(width: 358,height: 192)
              .overlay() {
                HStack{
                  VStack{
                    ForEach(transactions.vin, id: \.self) { vin in
                      if let prevoutDesembrulhado: Prevout = vin.prevout {
                        Text(prevoutDesembrulhado.scriptpubkey_address).foregroundColor(Color("laranja")).font(.system(size: 12))
                        Text("\(prevoutDesembrulhado.value / 100000000) BTC").foregroundColor(Color("cinza")).font(.system(size: 12))
                      } else {
                        Text("Coinbase").foregroundColor(Color("cinza")).font(.system(size: 12))
                      }
                    }
                  }
                  
                  Image(systemName: "chevron.right").foregroundColor(Color("cinza"))
                  
                  VStack {
                    ForEach(transactions.vout.indices, id: \.self) { index in
                      if let scriptpubkey_address = transactions.vout[index].scriptpubkey_address {
                        Text(scriptpubkey_address)
                          .foregroundColor(Color("cinza"))
                          .font(.system(size: 12))
                      } else {
                        Text("Coinbase")
                          .foregroundColor(Color("cinza"))
                          .font(.system(size: 12))
                      }
                      
                      
                      Text("\(transactions.vout[index].value / 100000000) BTC")
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
      transaction.getEachTransactionInfo(idTransacao)
    }
    
    
  }
}

