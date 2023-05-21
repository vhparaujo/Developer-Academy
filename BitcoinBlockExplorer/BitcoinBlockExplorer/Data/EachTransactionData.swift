//
//  EachTransactionData.swift
//  BitcoinBlockExplorer
//
//  Created by Victor Hugo Pacheco Araujo on 19/05/23.
//

import SwiftUI

class EachTransactionData: ObservableObject {
  @Published var eachTransactionDatas: [Transactions] = []
  
  func getEachTransactionInfo() {
    
    guard let url = URL(string: "https://mempool.space/api/tx/6506e89eacd62ddecd1ca9e97228800b0cf5dc143e91f7fdaace85b008f3eb57") else { return }
    
    let task = URLSession.shared.dataTask(with: url) {data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        let eachTransaction = try JSONDecoder().decode(Transactions.self, from: data)
        DispatchQueue.main.async {
          self.eachTransactionDatas = [eachTransaction]
        }
        
      }
      catch let error {
        print(error)
      }
    }
    task.resume()
    
  }
  
}