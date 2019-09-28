//
//  Stat.swift
//  PubgStats
//
//  Created by Mark O'Leary on 9/19/19.
//  Copyright © 2019 Mark O'Leary. All rights reserved.
//

import Foundation


// MARK: - PlayerSeasonStats
struct PlayerSeasonStats: Decodable {
    let data: DataClass?
    let links: Links?
    let meta: Meta?
}

// MARK: - DataClass
struct DataClass: Decodable {
    let type: String?
    let attributes: Attributes?
    let relationships: Relationships?
}

// MARK: - Attributes
struct Attributes: Decodable {
    let gameModeStats: GameModeStats?
    let bestRankPoint: Int?
}

// MARK: - GameModeStats
struct GameModeStats: Decodable {
    let duo, duoFpp, solo, soloFpp: Duo?
    let squad, squadFpp: Duo?
    
    enum CodingKeys: String, CodingKey {
        case duo
        case duoFpp = "duo-fpp"
        case solo
        case soloFpp = "solo-fpp"
        case squad
        case squadFpp = "squad-fpp"
    }
}

// MARK: - Duo
struct Duo: Decodable {
    let assists, boosts, dBNOS, dailyKills: Int?
    let dailyWINS: Int?
    let damageDealt: Double?
    let days, headshotKills, heals, killPoints: Int?
    let kills: Int?
    let longestKill, longestTimeSurvived: Double?
    let losses, maxKillStreaks: Int?
    let mostSurvivalTime: Double?
    let rankPoints: Int?
    let rankPointsTitle: String?
    let revives: Int?
    let rideDistance: Double?
    let roadKills, roundMostKills, roundsPlayed, suicides: Int?
    let swimDistance: Double?
    let teamKills: Int?
    let timeSurvived: Double?
    let top10S, vehicleDestroys: Int?
    let walkDistance: Double?
    let weaponsAcquired, weeklyKills, weeklyWINS, winPoints: Int?
    let wins: Int?
    
    enum CodingKeys: String, CodingKey {
        case assists, boosts
        case dBNOS = "dBNOs"
        case dailyKills
        case dailyWINS = "dailyWins"
        case damageDealt, days, headshotKills, heals, killPoints, kills, longestKill, longestTimeSurvived, losses, maxKillStreaks, mostSurvivalTime, rankPoints, rankPointsTitle, revives, rideDistance, roadKills, roundMostKills, roundsPlayed, suicides, swimDistance, teamKills, timeSurvived
        case top10S = "top10s"
        case vehicleDestroys, walkDistance, weaponsAcquired, weeklyKills
        case weeklyWINS = "weeklyWins"
        case winPoints, wins
    }
}

// MARK: - Relationships
struct Relationships: Decodable {
    let season, player: Player?
    let matchesSolo, matchesSoloFPP, matchesDuo, matchesDuoFPP: Matches?
    let matchesSquad, matchesSquadFPP: Matches?
}

// MARK: - Matches
struct Matches: Decodable {
    let data: [DAT]?
}

// MARK: - DAT
struct DAT: Decodable {
    let type: TypeEnum?
    let id: String?
}

enum TypeEnum: String, Decodable {
    case match = "match"
    case player = "player"
    case season = "season"
}

// MARK: - Player
struct Player: Decodable {
    let data: DAT?
}

// MARK: - Links
struct Links: Decodable {
    let linksSelf: String?
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - Meta
struct Meta: Decodable {
}
