//
//  Stat.swift
//  PubgStats
//
//  Created by Mark O'Leary on 9/19/19.
//  Copyright © 2019 Mark O'Leary. All rights reserved.
//

import Foundation


class Stat {
    
    let userId: Int
    let id: String
    let title: String
    let completed: Bool
    
    init(userId: Int, id: String, title: String, completed: Bool) {
        self.userId = userId
        self.id = id
        self.title = title
        self.completed = completed
    }
}
