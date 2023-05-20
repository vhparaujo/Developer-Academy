import SwiftUI
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct Response: Codable {
  
  // high priority
  let fastestFee: Int
  // medium priority
  let halfHourFee: Int
  // low priority
  let hourFee: Int
//  let economyFee: Int
//  let minimumFee: Int
  
}
  
if let url = URL(string: "https://mempool.space/api/v1/fees/recommended") {
  URLSession.shared.dataTask(with: url) {
    data, response, error in
    if let data = data {
      do{
        let res = try JSONDecoder().decode(Response.self, from: data)
        print(res.fastestFee)
      } catch let error {
        print(error)
      }
    }
  }.resume()
  
  
}


