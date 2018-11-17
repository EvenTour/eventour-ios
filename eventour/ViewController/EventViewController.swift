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
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    var event: Event?
    var isFavorite = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let event = event {
            logoImageView.setImageFrom(urlString: event.urlImage, withDefaultNamed: "no-image", withErrorNamed: "no-image")
            nameLabel.text = event.event_name
            descriptionLabel.text = event.startDate
            isFavorite = event.isFavorite
            updateFavoriteImage()
        }
    }
    
    func toggleFavorite() {
        if event != nil {
            isFavorite = !isFavorite
            self.event!.isFavorite = isFavorite
            updateFavoriteImage()
        }
    }
    
    func updateFavoriteImage() {
        favoriteButton.imageView!.setImage(fromAsset: isFavorite ?
            "heart-black" : "heart-border-black")
    }
    @IBAction func favoriteAction(_ sender: UIButton) {
        
        toggleFavorite()
        
    }
}
