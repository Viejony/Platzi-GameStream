//
//  SearchGame.swift
//  GameStream
//
//  Created by Jhonyfer Angarita on 12/06/22.
//

import Foundation


class SearchGame: ObservableObject{
    @Published var gameInfo = [Game]()
    
    func search(name: String){
        
        // Clear contents
        gameInfo.removeAll()
        
        // Get formated name
        let gameNameSpaces = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do{
                if let jsonData = data{
                    print("Json Size = \(jsonData)")
                    let decodeData = try JSONDecoder().decode(SearchResult.self, from: jsonData)
                    DispatchQueue.main.async{
                        self.gameInfo.append(contentsOf: decodeData.results)
                    }
                }
            }
            catch{
                print("Error: \(error)")
            }
        }.resume()
    }
}
