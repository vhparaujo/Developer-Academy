//
//  BlockHomeData.swift
//  TesteAPI
//
//  Created by Victor Hugo Pacheco Araujo on 16/05/23.
//

import SwiftUI

class BlockDataHome: ObservableObject {
  @Published var blockDatas: [Blocks] = []
  var maxBlockCount: Int = 0
  
  func fetch(_ maxBlockCount: Int) {
    guard let url = URL(string: "https://mempool.space/api/v1/blocks/") else { return }
    
    URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else { return }
      
      do {
        let blockHome = try JSONDecoder().decode([Blocks].self, from: data)
        DispatchQueue.main.async {
          if(blockHome.count > maxBlockCount){
            self.blockDatas = Array(blockHome.prefix(upTo: maxBlockCount))
          } else {
            self.blockDatas = blockHome
          }
          
        }
      } catch {
        print(error)
      }
    }.resume()
  }
  
}
