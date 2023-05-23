//
//  EveryTransactions.swift
//  TesteAPI
//
//  Created by Victor Hugo Pacheco Araujo on 16/05/23.
//

import SwiftUI

struct EveryTransactions: View {
  @StateObject var transactionData = TransactionData()
  
    var body: some View {
      NavigationStack{
        VStack{
          ScrollView{
          
            BoxTransactions()
            
          }
        }
        .padding()
      
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

struct EveryTransactions_Previews: PreviewProvider {
    static var previews: some View {
        EveryTransactions()
    }
}
