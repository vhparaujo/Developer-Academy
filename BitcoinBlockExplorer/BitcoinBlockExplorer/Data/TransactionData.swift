//
//  TransactionData.swift
//  TesteAPI
//
//  Created by Victor Hugo Pacheco Araujo on 17/05/23.
//

import SwiftUI

enum Erros: Error{
  case NSJSONSerializationErrorIndex
  case NSCocoaErrorDomain
  case NSDebugDescription
  case NotFound
}

class TransactionData: ObservableObject {
  @Published var transactionDatas: [EveryTransactionsModel] = []
  @Published var carregando = false
//  @Published var erro: Error? = nil
  
  func fetch() {
    
    self.carregando = true
    guard let url = URL(string: "https://mempool.space/api/mempool/recent") else { return }
    
    let task = URLSession.shared.dataTask(with: url) {data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        let transactionHome = try JSONDecoder().decode([EveryTransactionsModel].self, from: data)
        DispatchQueue.main.async {
          self.transactionDatas = transactionHome
        }
      }
//      catch Erros.NSDebugDescription {
//        self.erro = error
//      }
      catch let error {
//        if error.localizedDescription == "NSJSONSerializationErrorIndex" {
//          self.erro = error
//          print(error.localizedDescription)
//        } else {
//          print(error.localizedDescription)
//        }
        print(error)
      }
      DispatchQueue.main.async {
          self.carregando = false
      }
      
    }
    task.resume()
    
  }
  
}
