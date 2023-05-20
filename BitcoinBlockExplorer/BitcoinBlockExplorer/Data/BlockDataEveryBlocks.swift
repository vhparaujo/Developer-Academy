//
//  BlockDataEveryBlocks.swift
//  TesteAPI
//
//  Created by Victor Hugo Pacheco Araujo on 17/05/23.
//

import SwiftUI

class BlockDataEveryBlocks: ObservableObject {
  @Published var blockDatas: [Blocks] = []
  
  func fetch() {
    guard let url = URL(string: "https://mempool.space/api/v1/blocks/") else { return }
    
    URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else { return }
      
      do {
        let blockHome = try JSONDecoder().decode([Blocks].self, from: data)
        DispatchQueue.main.async {
            self.blockDatas = blockHome
        }
      } catch {
        print(error)
      }
    }.resume()
  }
  
}

