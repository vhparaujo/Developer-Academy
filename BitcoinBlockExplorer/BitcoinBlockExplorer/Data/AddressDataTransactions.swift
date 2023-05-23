//
//  AddressDataTransactions.swift
//  BitcoinBlockExplorer
//
//  Created by Victor Hugo Pacheco Araujo on 23/05/23.
//

import SwiftUI

class AddressDataTransactions: ObservableObject {
  @Published var addressDataTransactions: [Transactions] = []
  var address: String = ""
  
  func getAddressInfoTransactions(_ address: String) {
    
    guard let url = URL(string: "https://mempool.space/api/address/\(address)/txs/chain") else { return }
    
    let task = URLSession.shared.dataTask(with: url) {data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        let eachAddressTransaction = try JSONDecoder().decode([Transactions].self, from: data)
        DispatchQueue.main.async {
          self.addressDataTransactions = eachAddressTransaction
        }
        
      }
      catch let error {
        print(error)
      }
    }
    task.resume()

  }
 
}
