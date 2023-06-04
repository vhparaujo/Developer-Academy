//
//  Home.swift
//  TesteAPI
//
//  Created by Victor Hugo Pacheco Araujo on 16/05/23.
//

import SwiftUI

struct Home: View {
  @StateObject var validateAddresses = Validate()
  @StateObject var feeData = FeeData()
  @State var addressSearch: String = ""
  @State var idTransacaoSearch: String = ""
  @State var abrirModalAddress: Bool = false
  @State var abrirModalTransaction: Bool = false
  @State var idTransacaoButton: String = ""
  @State var searchText = ""
  
  var body: some View {
    NavigationView{
      VStack{
        ScrollView{
          Text("Taxas de transação").foregroundColor(Color("cinza")).bold()
            .font(.system(size: 17))
          ForEach(feeData.fees, id: \.self) { fee in
            
            VStack{
                HStack{
                  Text("Baixa Prioridade").foregroundColor(Color("cinza")).font(.system(size: 13))
                  Text("Media Prioridade").foregroundColor(Color("cinza")).font(.system(size: 13))
                  Text("Alta Prioridade").foregroundColor(Color("cinza")).font(.system(size: 13))
                }.padding()
                .background(Color("caixas")).cornerRadius(7)
              
              HStack{
                HStack {
                  Spacer()
                  ZStack{
                    RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 90,height: 47)
                    Text("\(fee.hourFee) sat/vB").foregroundColor(Color("cinza")).font(.system(size: 13))
                  }
                }.padding(.horizontal).offset(x: 17)
                  
                
                HStack {
                  ZStack{
                    RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 90,height: 47)
                    Text("\(fee.halfHourFee) sat/vB").foregroundColor(Color("cinza")).font(.system(size: 13))
                  }
                }.padding(.horizontal).offset(x: -3)
                  
                
                HStack {
                  ZStack{
                    RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 90,height: 47)
                    Text("\(fee.fastestFee) sat/vB").foregroundColor(Color("cinza")).font(.system(size: 13))
                    
                  }.padding(.horizontal).offset(x: -25)
                }
                
              }
              
            }
          }
          
          BoxBlocks()
  
          BoxTransactions()
          
        }
      }
      .onAppear {
        feeData.fetch()
      }
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
          Text("Bitcoin Block Explorer").foregroundColor(Color("laranja")).bold().font(.system(size: 20))
        }
      }
      .toolbarBackground(Color("azul"), for: .navigationBar)
      .background(Color("azul"))
    }
    
  }
  
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
