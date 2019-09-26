//
//  Stat.swift
//  PubgStats
//
//  Created by Mark O'Leary on 9/19/19.
//  Copyright © 2019 Mark O'Leary. All rights reserved.
//

import Foundation


struct Welcome: Decodable {
    let data: [WelcomeDatum]?
    let links: WelcomeLinks?
    let meta: Meta?
}

// MARK: - WelcomeDatum
struct WelcomeDatum: Decodable {
    let type, id: String?
    let attributes: Attributes?
    let relationships: Relationships?
    let links: DatumLinks?
}

// MARK: - Attributes
struct Attributes: Decodable {
    let name, shardID: String?
    let stats: Meta?
    let createdAt, updatedAt, patchVersion, titleID: String?
}

// MARK: - Meta
struct Meta: Decodable {
}

// MARK: - DatumLinks
struct DatumLinks: Decodable {
    let schema, linksSelf: String?
}

// MARK: - Relationships
struct Relationships: Decodable {
    let assets: Assets?
    let matches: Matches?
}

// MARK: - Assets
struct Assets: Decodable {
    let data: Meta?
}

// MARK: - Matches
struct Matches: Decodable {
    let data: [MatchesDatum]?
}

// MARK: - MatchesDatum
struct MatchesDatum: Decodable {
    let id, type: String?
}

// MARK: - WelcomeLinks
struct WelcomeLinks: Decodable {
    let linksSelf: String?
}

