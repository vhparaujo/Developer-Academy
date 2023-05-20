//
//  Jogadores.swift
//  MeuPrimeiroAppDia2
//
//  Created by Victor Hugo Pacheco Araujo on 20/04/23.
//

import SwiftUI

struct Jogadores {
  let cadaJogador: [Jogador]
  
  init() {
    self.cadaJogador = [
      .init(imagem: "andre"),
      .init(imagem: "cano"),
      .init(imagem: "ganso"),
      .init(imagem: "marcelo")
    ]
  }
 
}

struct Jogador: Identifiable {
  let id = UUID()
  let imagem: String
}
