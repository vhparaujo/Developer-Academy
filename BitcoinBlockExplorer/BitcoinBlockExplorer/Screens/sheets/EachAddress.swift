//
//  EachAddress.swift
//  BitcoinBlockExplorer
//
//  Created by Victor Hugo Pacheco Araujo on 23/05/23.
//

import SwiftUI

struct EachAddress: View {
  
  @StateObject var address = AddressDataHeader()
  
  @Binding var addressSearch: String
  @Binding var abrirModalAddress: Bool
  
  
  var body: some View {
    
    VStack{
      ScrollView{
        
        HStack{
          Spacer()
          Text("Endereço").foregroundColor(Color("cinza")).offset(x: 15, y: 15)
          
          Spacer()
          Button{
            abrirModalAddress.toggle()
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
            Text("Endereço").foregroundColor(Color("cinza")).font(.system(size: 15))
            
              Text("\(addressSearch)").foregroundColor(Color("laranja")).font(.system(size: 15))
            
          }
        }.offset(y: 25)
        
        ForEach(address.addressDatasHeader, id: \.self) { address in
          
          ZStack{
            RoundedRectangle(cornerRadius: 7).foregroundColor(Color("caixas")).frame(width: 358,height: 192)
            VStack{
              
              HStack{
                Text("Total Recebido").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: 30)
                Spacer()
                Text("\(address.chain_stats.funded_txo_sum) BTC").foregroundColor(Color("cinza")).font(.system(size: 15))
              }
              
              Divider().frame(width: 350)
              
              HStack{
                Text("Total Enviado").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: -80)
                Text("\(address.chain_stats.spent_txo_sum) BTC").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: 80)
              }
              
              Divider().frame(width: 350)
              
              HStack{
                Text("Saldo ").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: -85)
                Text("\(address.chain_stats.funded_txo_sum - address.chain_stats.spent_txo_sum) BTC").foregroundColor(Color("cinza")).font(.system(size: 15)).offset(x: 75)
              }
            }
            
          }
        }
        
      }
    }.onAppear(){
      address.getAddressInfoHeader(addressSearch)
    }
    
    
  }
}

struct EachAddress_Previews: PreviewProvider {
  static var previews: some View {
    EachAddress(addressSearch: .constant(""), abrirModalAddress: .constant(true))
  }
}
