////
////  EachTransactionModel.swift
////  BitcoinBlockExplorer
////
////  Created by Victor Hugo Pacheco Araujo on 19/05/23.
////
//
//import SwiftUI
//
//struct EachTransactionModel: Hashable, Codable {
//  let txid: String
//  let size: Int32
//  let fee: Double
//  let vin: [Vin]
//  let status: StatusT
//
//}
//
//struct Vin: Hashable, Codable {
//  let prevout: Prevout
//}
//
//struct Prevout: Hashable, Codable {
//  let scriptpubkey_address: String
//  let value: Double
//}
//
//struct StatusT: Hashable, Codable {
//  let confirmed: Bool
//  let block_height: Int64
//  let block_time: TimeInterval
//
//  func formatTransactionTime(_ block_time: TimeInterval) -> String {
//          let dateFormatter = DateFormatter()
//          //dateFormatter.locale = Locale(identifier: "pt_BR")
//          dateFormatter.dateFormat = "dd/MM/yyyy  HH:mm"
//
//          let date = Date(timeIntervalSince1970: block_time)
//          return dateFormatter.string(from: date)
//
//  }
//
//}