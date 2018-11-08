//
//  EventViewController.swift
//  eventour
//
//  Created by Rafael on 11/7/18.
//  Copyright © 2018 Rafael. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

   
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    var event: Event?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let event = event {
            logoImageView.setImageFrom(urlString: event.urlImage, withDefaultNamed: "no-image", withErrorNamed: "no-image")
            nameLabel.text = event.event_name
            descriptionLabel.text = event.startDate
        }
    }

}
