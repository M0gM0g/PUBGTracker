//
//  File.swift
//  PubgStats
//
//  Created by Mark O'Leary on 9/20/19.
//  Copyright © 2019 Mark O'Leary. All rights reserved.
//
// account.c0cbf694696d4c77885dc75ea7d43df6
import Foundation

class NetworkPubg {
    let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJlYzEyMTA2MC1iZDAyLTAxMzctNWE4Yi02OWIwNDIzNDczYzAiLCJpc3MiOiJnYW1lbG9ja2VyIiwiaWF0IjoxNTY4ODk0Mzk2LCJwdWIiOiJibHVlaG9sZSIsInRpdGxlIjoicHViZyIsImFwcCI6Im1hcmttb2xlYXJ5LWdtIn0.URs3K6ENnIKCQofOCvKJIecUk5GmFz-twmw2CzG2MMg"
    var playerToSend: String = ""
    var playerData: PlayerSeasonStats?
    
    func sendUserNameInfo (userName: String, completionHandler: @escaping () -> Void)  {
        let session = URLSession.shared
        let url = URL(string: "https://api.pubg.com/shards/steam/players?filter[playerNames]=\(userName)")!
        var getRequest = URLRequest(url: url)
        
        getRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        getRequest.setValue("application/vnd.api+json", forHTTPHeaderField: "accept")
        
        
       
        session.dataTask(with: getRequest) { (data, response, error) in
            guard let data = data else { return }
            
            var json: Any?
            do {
                json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            } catch {
                
            }
            
            guard let jsonDict = json as? [String: Any] else {
                return
            }
            
            let account: String = ((jsonDict["data"] as! [Any])[0] as! [String: Any])["id"] as! String
            
            print(account)
        
            self.playerToSend = account
            
            DispatchQueue.main.async { [weak self] in
                self!.sendPlayerIdClosure(completionHandler: completionHandler)
            }
        }.resume()
        
    }
    func sendPlayerIdClosure(completionHandler: @escaping () -> Void) {

        let session = URLSession.shared
        let url = URL(string: "https://api.pubg.com/shards/steam/players/\(playerToSend)/seasons/lifetime")!
        var getRequest = URLRequest(url: url)
        
        getRequest.setValue("application/vnd.api+json", forHTTPHeaderField: "accept")
        getRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        
        session.dataTask(with: getRequest) { (data, response, error) in
            guard let data = data else { return }
            
            do {
               let playerSeasonStats = try JSONDecoder().decode(PlayerSeasonStats.self, from: data)
                self.playerData = playerSeasonStats
                completionHandler()
                print("headshot kills", playerSeasonStats.data?.attributes?.gameModeStats?.soloFpp?.headshotKills ?? -1)
            } catch let jsonErr {
                print(jsonErr)
            }
                
                
        }.resume()
    
}
}
