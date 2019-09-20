//
//  ViewController.swift
//  PubgStats
//
//  Created by Mark O'Leary on 9/19/19.
//  Copyright © 2019 Mark O'Leary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchResults: [Stat] = []
    
    lazy var tapRecognizer: UITapGestureRecognizer = {
        var recognizer = UITapGestureRecognizer(target:self, action: #selector(dismissKeyboard))
        return recognizer
    }()
    
    @objc func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()

        guard let searchText = searchBar.text, !searchText.isEmpty else {
            return
        }

        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        queryService.getStatsResults(searchTerm: searchText) { [weak self] results, errorMessage in UIApplication.shared.isNetworkActivityIndicatorVisible = false

            if let results = results {
                self?.searchResults = results
            }


            if !errorMessage.isEmpty {
                print("Search Error: " + errorMessage)
            }
        }
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        view.addGestureRecognizer(tapRecognizer)
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        view.removeGestureRecognizer(tapRecognizer)
    }

}
