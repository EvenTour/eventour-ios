//
//  FavoritesViewController.swift
//  eventour
//
//  Created by Rafael on 10/29/18.
//  Copyright © 2018 Rafael. All rights reserved.
//

import Foundation

class FavoritesViewController: EventsViewController {
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.isRestrictedToFavorites = true
        super.viewWillAppear(animated)
    }
}
