//
//  IMessageView.swift
//  MeuPrimeiroAppDia2
//
//  Created by Victor Hugo Pacheco Araujo on 17/04/23.
//

import SwiftUI

struct IMessageView: View {
var body: some View {

    VStack{

        HStack{
            Image(systemName: "lessthan").foregroundColor(Color.blue)
            Text("Filters").foregroundColor(Color.blue)
            Spacer()
            Image(systemName: "ellipsis.circle").foregroundColor(Color.blue)
            Image(systemName: "square.and.pencil").foregroundColor(Color.blue)
        }.padding().frame(height: 30)

        HStack {
            Text("Messages").font(.system(size: 36)).bold()
            Spacer()
        }.padding().frame(height: 50)

        HStack{
            Image(systemName: "magnifyingglass")
            .padding()
            Text("Search").foregroundColor(Color.gray)
            Spacer()
        }.frame(width: 350,height: 30)
        .background(Color(red: 0.201, green: 0.205, blue: 0.208, opacity: 0.255)).cornerRadius(10)

        ScrollView{
                ForEach(1...10, id: \.self){_ in
                    Group{
                        HStack {

                            Image(systemName: "person.circle.fill").resizable().frame(width: 50, height: 50).foregroundColor(Color .gray)
                            
                            VStack{
                                Divider()
                                HStack{
                                    
                                    Text("29738").font(.system(size: 18)).bold()
                                    Spacer()
                                    Text("Saturday  >").foregroundColor(Color.gray)
                                    
                                }
                                
                                HStack{
                                    Text("Peca seu Cartao Atacadao novamente em atacadao.cc/3Gd8zmP. Seu credito").frame(maxWidth: .infinity).lineLimit(2)
                                    Spacer()
                                    
                                    Image(systemName: "bell.slash").foregroundColor(Color.gray)
                                }
                            }
                        }.padding([.bottom, .horizontal])
                    }
                    
                    Group{
                        HStack{
                            
                            Image(systemName: "person.circle.fill").resizable().frame(width: 50, height: 50).foregroundColor(Color .gray)
                            
                            
                            VStack{
                                Divider()
                                HStack{
                                    Text("29468").font(.system(size: 18)).bold()
                                    Spacer()
                                    Text("Thursday  >").foregroundColor(Color.gray)
                                }
                                HStack{
                                    Text("842 638 is your Instagram code. Don't share it.").lineLimit(1)
                                    Spacer()
                                    
                                    Image(systemName: "bell.slash").foregroundColor(Color.gray)
                                }
                            }
                        }.padding([.bottom, .horizontal])
                    }
                    Group{
                        HStack{
                            Image(systemName: "person.circle.fill").resizable().frame(width: 50, height: 50).foregroundColor(Color .gray)
                            
                            VStack{
                                Divider()
                                HStack{
                                    Text("VIVO").font(.system(size: 18)).bold()
                                    Spacer()
                                    Text("Thursday  >").foregroundColor(Color.gray)
                                }
                                HStack{
                                    Text("Venha conferir a temporada 1 de Sucession, que conta sobre uma fami...").lineLimit(2)
                                    Spacer()
                                }
                            }
                        }.padding([.bottom, .horizontal])
                    }
                }
        }
        Spacer()
      }
    }
}

struct IMessageView_Previews: PreviewProvider {
    static var previews: some View {
    IMessageView()
    }
}
