//
//  ViewController.swift
//  PubgStats
//
//  Created by Mark O'Leary on 9/19/19.
//  Copyright © 2019 Mark O'Leary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    var networkPubg = NetworkPubg()
    var playerData: PlayerSeasonStats?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBAction func submitButton(_ sender: Any ) {
        
        let text: String = self.usernameTextField.text ?? ""
        
        self.networkPubg.sendUserNameInfo(userName: text, completionHandler: {
            self.playerData = self.networkPubg.playerData
            
                self.performSegue(withIdentifier: "mainToStatsSegue", sender: self)
                self.usernameTextField.text = ""            
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is StatsViewController
        {
            let vc = segue.destination as? StatsViewController
            vc?.playerData = self.playerData
        }
        
    }
}
