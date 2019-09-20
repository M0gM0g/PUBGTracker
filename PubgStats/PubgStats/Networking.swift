//
//  File.swift
//  PubgStats
//
//  Created by Mark O'Leary on 9/20/19.
//  Copyright © 2019 Mark O'Leary. All rights reserved.
//

import Foundation


class Networking {
    
    
    
    func pubgNetworking () {


    let session = URLSession.shared
    let url = URL(string: "https://api.pubg.com/shards/steam")!
    
    let task = session.dataTask(with: url, completionHandler: { data, response, error in
        
        print(data)
        print(response)
        print(error)
    })
        
        task.resume()
}
}
