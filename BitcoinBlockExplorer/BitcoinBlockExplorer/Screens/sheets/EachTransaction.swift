//
//  EachTransaction.swift
//  BitcoinBlockExplorer
//
//  Created by Victor Hugo Pacheco Araujo on 18/05/23.
//

import SwiftUI

struct EachTransaction: View {
  @StateObject var transaction = EachTransactionData()
  @Binding var abrirModal: Bool
  
  var body: some View {
    VStack{
      ScrollView{
        ZStack{
          RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 147,height: 40)
          Text("Transação").foregroundColor(Color("cinza"))
          
        }
        ForEach(transaction.eachTransactionDatas, id: \.self) { transactions in
          
          VStack{
            Text("\(transactions.txid)").foregroundColor(Color("laranja"))
          }
        }
      }
    }.onAppear() {
      transaction.getEachTransactionInfo()
    }
    
    
  }
}

