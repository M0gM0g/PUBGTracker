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
        
        longestKillLabel?.text = "\(playerData?.data?.attributes?.gameModeStats?.duoFpp?.damageDealt ?? 0 )"
        
            roundsPlayedLabel?.text = roundsPlayedLabel.text
        
            topTensLabel?.text = topTensLabel.text

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
