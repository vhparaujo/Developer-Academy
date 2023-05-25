//
//  FeeData.swift
//  TesteAPI
//
//  Created by Victor Hugo Pacheco Araujo on 15/05/23.
//

import SwiftUI

class FeeData: ObservableObject {
  @Published var fees: [Fee] = []
  @Published var carregando = false

  func fetch() {
    guard let url = URL(string: "https://mempool.space/api/v1/fees/recommended") else {
      return
    }

    let task = URLSession.shared.dataTask(with: url) {data, _, error in
      guard let data = data, error == nil else {
        return
      }

      self.carregando = true
      
      do {
        let feesInfo = try JSONDecoder().decode(Fee.self, from: data)
//        print(feesInfo)
        DispatchQueue.main.async {
          self.fees = [feesInfo]
        }
      } catch let error {
        print(error)
      }
      
      self.carregando = false
    }
    task.resume()

  }

}
