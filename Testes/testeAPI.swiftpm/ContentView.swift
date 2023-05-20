import SwiftUI

struct Response: Decodable {
  
  // high priority
  let fastestFee: Int
  // medium priority
  let halfHourFee: Int
  // low priority
  let hourFee: Int
//  let economyFee: Int
//  let minimumFee: Int
  
}

class TaxasDaRede {

  if let url = URL(string: "https://mempool.space/api/v1/fees/recommended") {
    URLSession.shared.dataTask(with: url) {
      data, response, error in
      if let data = data {
        do{
          let res = try JSONDecoder().decode(Response.self, from: data)
        } catch let error {
          print(error)
        }
      }
    }.resume()
    
    struct ContentView: View {
      var body: some View {
        VStack {
          Image(systemName: "globe")
            .imageScale(.large)
            .foregroundColor(.accentColor)
          Text("Hello, world!")
        }
      }
    }
    
    
    
}
