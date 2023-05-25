//
//  EachTransaction.swift
//  BitcoinBlockExplorer
//
//  Created by Victor Hugo Pacheco Araujo on 18/05/23.
//

import SwiftUI

struct EachTransaction: View {
  @StateObject var transaction = EachTransactionData()
  @Binding var idTransacaoButton: String
  @Binding var idTransacaoSearch: String
  @Binding var abrirModalTransaction: Bool
  
  var body: some View {
    VStack{
      ScrollView{
        
        HStack{
          Spacer()
          Text("Transação").foregroundColor(Color("cinza")).offset(x: 15, y: 15)
          Spacer()
          Button{
            abrirModalTransaction.toggle()
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
        
        HStack{
        }.padding(.bottom, 30)
        
        Button {
          UIPasteboard.general.string = "\(idTransacaoButton) \(idTransacaoSearch)"
        } label: {
          RoundedRectangle(cornerRadius: 7)
            .fill()
            .foregroundColor(Color("caixas"))
            .frame(width: 358,height: 40)
            .overlay {
              HStack{
                Text("Transação").foregroundColor(Color("cinza")).font(.system(size: 15)).padding(.horizontal)
                Spacer()
                if(idTransacaoButton == "") {
                  Text("\(String(idTransacaoSearch.prefix(25)))...").foregroundColor(Color("laranja")).font(.system(size: 15)).padding()
                } else {
                  Text("\(String(idTransacaoButton.prefix(25)))...").foregroundColor(Color("laranja")).font(.system(size: 15)).padding()
                }
              }
              
            }
        }
        
        ForEach(transaction.eachTransactionDatas, id: \.self) { transactions in
          
          HStack{
            
            HStack{
              if let blockHeightDesembrulhado = transactions.status.block_height {
                ZStack{
                  RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 147,height: 40)
                  HStack{
                    Text("Bloco").foregroundColor(Color("cinza")).font(.system(size: 15))
                    Text("\(blockHeightDesembrulhado)").foregroundColor(Color("cinza")).font(.system(size: 15))
                  }
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
          
          
          RoundedRectangle(cornerRadius: 7)
            .fill()
            .foregroundColor(Color("caixas"))
            .frame(width: 358,height: 170)
            .overlay {
              VStack{
                
                HStack{
                  Text("Data/Hora").foregroundColor(Color("cinza")).font(.system(size: 15)).padding(.horizontal)
                  Spacer()
                  if let blockTimeDesembrulhado = transactions.status.block_time, let formattedTime = transactions.status.formatTime(blockTimeDesembrulhado) {
                    Text("\(formattedTime)").foregroundColor(Color("laranja")).font(.system(size: 15)).padding(.horizontal)
                  } else {
                    Text("Aguardando confirmação").foregroundColor(Color("laranja")).font(.system(size: 15)).padding(.horizontal)
                  }
                }
                
                Divider().frame(width: 350)
                
                HStack{
                  Text("Tamanho").foregroundColor(Color("cinza")).font(.system(size: 15)).padding(.horizontal)
                  Spacer()
                  Text("\(transactions.size) B").foregroundColor(Color("laranja")).font(.system(size: 15)).padding(.horizontal)
                }
                
                Divider().frame(width: 350)
                
                HStack{
                  Text("Taxa ").foregroundColor(Color("cinza")).font(.system(size: 15)).padding(.horizontal)
                  Spacer()
                  Text("\(transactions.fee / 100000000) BTC").foregroundColor(Color("laranja")).font(.system(size: 15)).padding(.horizontal)
                }
                
              }
              
            }
          
          
          HStack{
            Text("Entradas e Saídas").foregroundColor(Color("cinza")).font(.system(size: 15))
            Spacer()
          }.padding()
          
          VStack{
            HStack{
              VStack{
                ForEach(transactions.vin, id: \.self) { vin in
                  if let prevoutDesembrulhado: Prevout = vin.prevout {
                    Text("\(String(prevoutDesembrulhado.scriptpubkey_address.prefix(15)))...").foregroundColor(Color("laranja")).font(.system(size: 12))
                    Text("\(prevoutDesembrulhado.value / 100000000) BTC").foregroundColor(Color("cinza")).font(.system(size: 12))
                  } else {
                    Text("Coinbase").foregroundColor(Color("cinza")).font(.system(size: 12))
                  }
                }
              }
              Spacer()
              Image(systemName: "chevron.right").foregroundColor(Color("cinza"))
              Spacer()
              VStack {
                ForEach(transactions.vout.indices, id: \.self) { index in
                  if let scriptpubkey_address = transactions.vout[index].scriptpubkey_address {
                    Text("\(String(scriptpubkey_address.prefix(15)))...")
                      .foregroundColor(Color("laranja"))
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
              
            }.padding()
              .background(Color("caixas")).cornerRadius(7)
          }.padding(.horizontal)
          
        }
        
      }
    }.onAppear() {
      if idTransacaoButton == "" {
        transaction.getEachTransactionInfo(idTransacaoSearch)
        //print(idTransacaoSearch) teste
      } else {
        transaction.getEachTransactionInfo(idTransacaoButton)
      }
    }
    
  }
}
