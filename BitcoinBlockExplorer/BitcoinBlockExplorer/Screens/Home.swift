//
//  Home.swift
//  TesteAPI
//
//  Created by Victor Hugo Pacheco Araujo on 16/05/23.
//

import SwiftUI

struct Home: View {
  @StateObject var feeData = FeeData()
  @State var searchText = ""
  
  var body: some View {
    NavigationView{
      VStack{
        ScrollView{
          
          Text("Taxas de transação").foregroundColor(Color("cinza")).font(.system(size: 17))
          ForEach(feeData.fees, id: \.self) { fee in
            
            VStack{
              ZStack{
                RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 343,height: 41)
                HStack{
                  Text("Alta Prioridade").foregroundColor(Color("cinza")).font(.system(size: 13))
                  Text("Media Prioridade").foregroundColor(Color("cinza")).font(.system(size: 13))
                  Text("Baixa Prioridade").foregroundColor(Color("cinza")).font(.system(size: 13))
                }
              }
              
              HStack{
                HStack {
                  Spacer()
                  ZStack{
                    RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 90,height: 47)
                    Text("\(fee.fastestFee) sat/vB").foregroundColor(Color("cinza")).font(.system(size: 13))
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
                    Text("\(fee.hourFee) sat/vB").foregroundColor(Color("cinza")).font(.system(size: 13))
                    
                  }.padding(.horizontal).offset(x: -25)
                }
                
              }
              
              
            }
          }
          
          BoxBlocks()
  
          BoxTransactions()
          
        }
      }
      .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Blocos, endereços ou transações")
      .padding()
      .onAppear {
        feeData.fetch()
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

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
