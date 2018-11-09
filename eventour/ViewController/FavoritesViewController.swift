//
//  FavoritesViewController.swift
//  eventour
//
//  Created by Rafael on 10/29/18.
//  Copyright © 2018 Rafael. All rights reserved.
//
import UIKit

import os
import Foundation

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var sampleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sample = "https://images.pexels.com/photos/58625/pexels-photo-58625.jpeg?cs=srgb&dl=apple-buildings-camera-58625.jpg&fm=jpg"
        
        sampleImageView.setImageFrom(
            urlString: sample,
            withDefaultNamed: "no-image",
            withErrorNamed: "no-image")
        
    }
    
    
}
