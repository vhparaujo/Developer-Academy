//
//  BlockTransactionData.swift
//  BitcoinBlockExplorer
//
//  Created by Victor Hugo Pacheco Araujo on 18/05/23.
//

import SwiftUI

class BlockTransactionsData: ObservableObject {
  
  @Published var blockTransactionsData: [Transactions] = []
  var hashBlock: String = ""
  
  func getEachBlocksInfo(_ hashBlock: String) {
    // todo: tentar trocar o hash do bloco
    guard let url = URL(string: "https://mempool.space/api/block/\(hashBlock)/txs") else { return }
    
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
