//
//  StatsViewController.swift
//  PubgStats
//
//  Created by Mark O'Leary on 9/28/19.
//  Copyright © 2019 Mark O'Leary. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    var playerData: PlayerSeasonStats?

    var damageDealt: String = ""
    var longestKill: String = ""
    var roundsPlayed: String = ""
    var topTens: String = ""
    
    @IBOutlet weak var damageDealtLabel: UILabel!
    
    @IBOutlet weak var longestKillLabel: UILabel!
    
    @IBOutlet weak var roundsPlayedLabel: UILabel!
    
    @IBOutlet weak var topTensLabel: UILabel!
    
    
    @IBAction func dismissPlayerStats(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
            self.damageDealtLabel?.text = damageDealtLabel.text! + "\(self.playerData?.data?.attributes?.gameModeStats?.duoFpp?.damageDealt ?? 0 )"
        
            self.longestKillLabel?.text = longestKillLabel.text! +  "\(self.playerData?.data?.attributes?.gameModeStats?.duoFpp?.longestKill ?? 0 )"
        
            self.roundsPlayedLabel?.text = roundsPlayedLabel.text! + "\(self.playerData?.data?.attributes?.gameModeStats?.duoFpp?.roundsPlayed ?? 0)"
        
            self.topTensLabel?.text = self.topTensLabel.text! + "\(self.playerData?.data?.attributes?.gameModeStats?.duoFpp?.top10S ?? 0)"

    }
}
