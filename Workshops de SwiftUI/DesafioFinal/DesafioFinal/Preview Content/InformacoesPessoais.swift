//
//  eachPlayer.swift
//  DesafioFinal
//
//  Created by Victor Hugo Pacheco Araujo on 20/04/23.
//

import SwiftUI

// struct de declaracao das variaveis
struct Players {
  var favoritado: Bool
  var imagemLista: String
  var imagemFundo: String
  var nome: String
  var ranking: String
  var tituloBiografia: String
  var biografia: String
}

// struct que contem todas as informacoes pessoais dos tenistas
struct InformacoesPessoais: View {
  // binding para favoritos
  @Binding var favoritoOn: Bool
  // state do tipo array de Players
  @State var player:[Players] = [
    Players(favoritado: false, imagemLista: "djoko", imagemFundo: "djoko2", nome: "Novak Djokovic", ranking: "Numero: 1", tituloBiografia: "Biografia Novak Djokovic", biografia: "Novak Djokovic (sérvio: Новак Ђоковић, Novak Đoković; [nɔ̂ʋaːk dʑɔ̂ːkɔʋitɕ]; Belgrado, Iugoslávia, 22 de maio de 1987) é um tenista profissional sérvio.[2] É o atual número 1 em simples e recordista de semanas no topo do ranking mundial masculino de tênis.[3] Com 22 conquistas em Grand Slams, é o primeiro jogador da história do tênis a passar a marca de US$ 100 milhões em faturamento com premiação por performance em quadra.Djokovic assumiu a liderança do ranking mundial pela primeira vez no dia 4 de julho de 2011 permanecendo até 8 de julho de 2012, voltou a liderar entre novembro de 2012 e setembro de 2013, reassumiu o topo em 7 de julho de 2014 e permaneceu como número 1 até 6 de novembro de 2016, retornou à primeira posição no ranking em 5 de novembro de 2018 até 3 de novembro de 2019 e, por fim, passou a ocupar o topo do ranking em 3 de fevereiro de 2020 onde permaneceu até a ascensão do russo Daniil Medvedev ao primeiro lugar do ranking por 2 semanas, realizada após a campanha do mesmo no ATP 500 de Acapulco e posteriormente recuperando o posto por 10 semanas consecutivas entre março e junho.[3] É o tenista que ocupou o topo do ranking por mais tempo, totalizando 373 semanas como número um do mundo, ultrapassando Roger Federer, que ocupou o primeiro lugar por 310 semanas."),
    Players(favoritado: false, imagemLista: "nadal", imagemFundo: "nadal2", nome: "Rafael Nadal", ranking: "Numero: 2", tituloBiografia: "Biografia Rafael Nadal", biografia: "Rafael Nadal (1986) é um tenista espanhol. Com 19 anos já havia conquistado o segundo lugar no ranking mundial masculino da Associação de Tênis Profissional (ATP). Com 22 anos se tornou o n.º 1 do mundo. Em 2022, venceu o seu 22.º título de Grand Slan, em Roland Garrot.Rafael Nadal Parera (1986) nasceu em Manacor, Ilha de Maiorca, Espanha, no dia 3 de junho de 1986. Começou a jogar tênis com 3 anos, com 5 anos ia ao clube treinar duas vezes por semana. Seu maior incentivador foi seu tio Antônio (Toni), que se tornou seu treinador.Com 12 anos, Nadal conseguiu títulos na Espanha e em outros países, jogando com jovens da mesma idade. No final de 2001, com 15 anos, se inscreveu na ATP, no posto 818."),
    Players(favoritado: false, imagemLista: "federer", imagemFundo: "federer2", nome: "Roger Federer", ranking: "Aposentado", tituloBiografia: "Biografia Roger Federer", biografia: "Roger Federer (1981) é um tenista suíço, um dos melhores jogadores de todos os tempos, o maior vencedor do Grand Slam, com 17 títulos.Roger Federer (1981) nasceu na Basileia, Suíça, no dia 8 de agosto de 1981. Filho de Robert, um suíço e de Lynette, uma sul-africana, com 8 anos, começou a jogar tênis, mas só se destacou entre os juniores quando em 1998 venceu o simples e duplas de Wimbledon, terminando pela primeira vez no topo de um ranking.Ainda em 1998 iniciou sua carreira profissional no Rado Open, em Gstaad, na Suíça, mas perdeu para o argentino Lucas Arnold Ker. Em 1999 chegou entre os 100 primeiros do ranking da Associação de Tenistas Profissionais (ATP). Em 2000 chegou a uma final no Aberto de Marselha, sendo derrotado pelo suíço Marc Rosset. Nesse mesmo ano, foi vice no Aberto da Basileia.")
  ]

  var body: some View{
    // forEach para fazer a verificacao do favorito e ao mesmo tempo
    // colocar dentro da lista de players os dados destes
    ForEach(0...player.count-1, id: \.self){
      if(favoritoOn == false || player[$0].favoritado == true) {
        ListaDePlayers(favoritado: $player[$0].favoritado, dados: $player[$0])
      }
    }
  }
}
