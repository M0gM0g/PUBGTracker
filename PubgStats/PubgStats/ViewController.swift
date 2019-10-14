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
        errorLabel.text = "User cannot be found."
        errorLabel.isHidden = true 
        
    }
    @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBAction func submitButton(_ sender: Any ) {
        
        let text: String = self.usernameTextField.text ?? ""
        
        
        
        self.networkPubg.sendUserNameInfo(userName: text, completionHandler: { wasSuccessfull in
            DispatchQueue.main.async {
            if wasSuccessfull == true {
            self.playerData = self.networkPubg.playerData
            
                self.performSegue(withIdentifier: "mainToStatsSegue", sender: self)
            } else {
                self.errorLabel.isHidden = false

            }
                self.usernameTextField.text = ""

            }
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
