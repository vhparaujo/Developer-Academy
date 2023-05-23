//
//  BoxTransactions.swift
//  BitcoinBlockExplorer
//
//  Created by Victor Hugo Pacheco Araujo on 18/05/23.
//

import SwiftUI

struct BoxTransactions: View {
  @StateObject var transactionData = TransactionData()
  @State var idTransacaoButton: String = ""
  @State var idTransacaoSearch: String = ""
  @State var abrirModalTransaction: Bool = false
  
  var body: some View {
    VStack{
      HStack {
        Text("Transações").foregroundColor(Color("cinza")).font(.system(size: 17))
        Spacer()
      }.padding()
      
      LazyVStack{
        ForEach(transactionData.transactionDatas, id: \.self) { transactions in
          
          Button{
            abrirModalTransaction.toggle()
          } label: {
            ZStack{
              RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 355,height: 71)
              HStack{
                VStack{
                  Spacer()
                  Text("ID transação").font(.system(size: 13)).foregroundColor(Color("cinza")).font(.system(size: 12))
                  Spacer()
                  Text("\(String(transactions.txid.prefix(21)))...").foregroundColor(Color("laranja")).font(.system(size: 12))
                  Spacer()
                }
                VStack{
                  Spacer()
                  Text("Valor").font(.system(size: 13)).foregroundColor(Color("cinza")).font(.system(size: 12))
                  Spacer()
                  Text("\(transactions.value / 100000000) BTC").font(.system(size: 12)).foregroundColor(Color("cinza")).font(.system(size: 12))
                  Spacer()
                }
                
                VStack{
                  Spacer()
                  Text("Taxa").font(.system(size: 13)).foregroundColor(Color("cinza")).font(.system(size: 12)).offset(y: -6.5)
                  Spacer()
                  Text("\(Int(transactions.fee)) sat").font(.system(size: 12)).foregroundColor(Color("cinza")).font(.system(size: 12)).offset(y: -14)
                  
                }
              }
            }.onTapGesture {
              idTransacaoButton = transactions.txid
              abrirModalTransaction.toggle()
            }
          }
          
        }
      }
    }.sheet(isPresented: $abrirModalTransaction) {
      EachTransaction(idTransacaoButton: $idTransacaoButton, idTransacaoSearch: $idTransacaoSearch, abrirModalTransaction: $abrirModalTransaction).presentationDetents([.height(650), .fraction(0.90)])
        .presentationBackground(Color("azul"))
    }
    
    .onAppear {
      transactionData.fetch()
    }
    
  }
}

struct BoxTransactions_Previews: PreviewProvider {
  static var previews: some View {
    BoxTransactions().environment(\.colorScheme, .dark)
      .environment(\.colorScheme, .light)
  }
}
