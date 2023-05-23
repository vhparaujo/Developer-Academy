//
//  EveryTransactions.swift
//  TesteAPI
//
//  Created by Victor Hugo Pacheco Araujo on 16/05/23.
//

import SwiftUI

struct EveryTransactions: View {
  @StateObject var transactionData = TransactionData()
  @StateObject var validateAddresses = Validate()
  // using the search
  @State var addressSearch: String = ""
  @State var idTransacaoSearch: String = ""
  @State var abrirModalTransaction: Bool = false
  @State var abrirModalAddress: Bool = false
  @State var idTransacaoButton: String = ""
  @State var searchText = ""
  
    var body: some View {
      NavigationStack{
        VStack{
          ScrollView{
          
            BoxTransactions()
            
          }
        }
        .padding()
        
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
