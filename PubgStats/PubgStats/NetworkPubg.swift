//
//  File.swift
//  PubgStats
//
//  Created by Mark O'Leary on 9/20/19.
//  Copyright © 2019 Mark O'Leary. All rights reserved.
//

import Foundation

//https://api.pubg.com/shards/steam/players?filter[playerNames]=MogMog
//curl -X GET "https://api.pubg.com/shards/steam/players?filter[playerNames]=MogMog" -H "accept: application/vnd.api+json" -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJlYzEyMTA2MC1iZDAyLTAxMzctNWE4Yi02OWIwNDIzNDczYzAiLCJpc3MiOiJnYW1lbG9ja2VyIiwiaWF0IjoxNTY4ODk0Mzk2LCJwdWIiOiJibHVlaG9sZSIsInRpdGxlIjoicHViZyIsImFwcCI6Im1hcmttb2xlYXJ5LWdtIn0.URs3K6ENnIKCQofOCvKJIecUk5GmFz-twmw2CzG2MMg"


class NetworkPubg {
    let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJlYzEyMTA2MC1iZDAyLTAxMzctNWE4Yi02OWIwNDIzNDczYzAiLCJpc3MiOiJnYW1lbG9ja2VyIiwiaWF0IjoxNTY4ODk0Mzk2LCJwdWIiOiJibHVlaG9sZSIsInRpdGxlIjoicHViZyIsImFwcCI6Im1hcmttb2xlYXJ5LWdtIn0.URs3K6ENnIKCQofOCvKJIecUk5GmFz-twmw2CzG2MMg"
    
    func sendUserNameInfo (userName: String) {
        let session = URLSession.shared
        let url = URL(string: "https://api.pubg.com/shards/steam/players?filter[playerNames]=\(userName)")!
        var getRequest = URLRequest(url: url)
        
        getRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        getRequest.setValue("application/vnd.api+json", forHTTPHeaderField: "accept")
        
        let task = session.dataTask(with: getRequest, completionHandler: { data, response, error in
        print(data)
        print(response)
        print(error)
    })
        
        task.resume()
}
}
