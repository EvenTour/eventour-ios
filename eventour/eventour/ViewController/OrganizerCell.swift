//
//  OrganizerCell.swift
//  eventour
//
//  Created by Rafael on 11/7/18.
//  Copyright © 2018 Rafael. All rights reserved.
//

import UIKit

class OrganizerCell: UICollectionViewCell {
    
    
    @IBOutlet weak var logoImageView: UIImageView!
    
   
    @IBOutlet weak var nameLabel: UILabel!
    
    

    func update(from organizer: Organizer) {
        logoImageView.setImageFrom(
            urlString: organizer.urlImage, withDefaultNamed: "no-image", withErrorNamed: "no-image")
        nameLabel.text = organizer.name
    }}
    

