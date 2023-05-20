//
//  DesafioExtraView.swift
//  MeuPrimeiroApp
//
//  Created by Victor Hugo Pacheco Araujo on 14/04/23.
//

import SwiftUI

struct DesafioExtraView: View {
    let colunas: Int = 3
    let linhas: Int = 50
    var body: some View {
        
        VStack{
            Text("Academy App")
            ZStack{
                
                Circle().frame(width: 200, height: 200)
                Image(systemName: "star.fill").resizable().colorInvert()
                    .frame(width: 60, height: 60)
            }
             
            ScrollView{
                VStack{
                    ForEach(1...linhas, id: \.self){_ in
                        HStack{
                            ForEach(1...colunas, id: \.self){_ in
                                Rectangle().cornerRadius(20).frame(width: 120, height: 150)
                        }
                
                        }
                    }
                }
            }
            
            HStack {
                
                VStack{
                    Image(systemName: "house").foregroundColor(Color .blue)
                    Text("Home")
                }.padding()
                
                VStack{
                    Image(systemName: "pencil").foregroundColor(Color .blue)
                    Text("Activities")
                }.padding()
                
                VStack {
                    Image(systemName: "trophy").foregroundColor(Color .blue)
                    Text("Ranking")
                }.padding()
                
            }.padding()

        }.padding()
   
    }
}

struct DesafioExtraView_Previews: PreviewProvider {
    static var previews: some View {
        DesafioExtraView()
    }
}
