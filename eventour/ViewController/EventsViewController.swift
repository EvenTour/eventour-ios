//
//  EventViewController.swift
//  eventour
//
//  Created by Rafael on 10/29/18.
//  Copyright © 2018 Rafael. All rights reserved.
//

import UIKit

import os


private let reuseIdentifier = "Cell"

class EventsViewController: UICollectionViewController {

    var events : [Event] = [Event]()
    var currentRow = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventourApi.getEventos(
            responseHandler: handleResponse,
            errorHandler: handleError)
        
    }
    
    func handleResponse(eventos: [Event]?){
        if let events = eventos{
            
            self.events = events
            self.collectionView.reloadData()
        }
        
    }
    
    func handleError(error:Error){
        
        let message = "Error on Event Request:  \(error.localizedDescription)"
        
        os_log("%@",message)
        
    }

    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return events.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EventCell
    
        // Configure the cell
        
        cell.update(from : events[indexPath.row])
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEvent" {
            let destination = segue.destination as! EventViewController
            destination.event = events[currentRow]
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentRow = indexPath.row
        performSegue(withIdentifier: "showEvent", sender: self)
    }
}
