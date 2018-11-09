//
//  OrganizerViewController.swift
//  eventour
//
//  Created by Rafael on 11/7/18.
//  Copyright © 2018 Rafael. All rights reserved.
//

import UIKit

class OrganizerViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    var organizer: Organizer?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let organizer = organizer {
            logoImageView.setImageFrom(urlString: organizer.urlImage, withDefaultNamed: "no-image", withErrorNamed: "no-image")
            nameLabel.text = organizer.name
            descriptionLabel.text = organizer.contactUrl
        }
    }
  

}
