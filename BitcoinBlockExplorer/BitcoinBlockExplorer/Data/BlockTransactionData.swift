//
//  BlockTransactionData.swift
//  BitcoinBlockExplorer
//
//  Created by Victor Hugo Pacheco Araujo on 18/05/23.
//

import SwiftUI

class BlockTransactionsData: ObservableObject {
  @Published var blockTransactionsData: [Transactions] = []
  
  func getEachBlocksInfo() {
    // todo: tentar trocar o hash do bloco
    guard let url = URL(string: "https://mempool.space/api/block/000000000000000015dc777b3ff2611091336355d3f0ee9766a2cf3be8e4b1ce/txs") else { return }
    
    let task = URLSession.shared.dataTask(with: url) {data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        var blockTransaction = try JSONDecoder().decode([Transactions].self, from: data)
        DispatchQueue.main.async {
          self.blockTransactionsData = blockTransaction
        }
        blockTransaction.removeFirst(2)
      }
      catch let error {
        print(error)
      }
    }
    task.resume()
    
  }
  
}
