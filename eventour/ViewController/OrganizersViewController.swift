//
//  OrganizersViewController.swift
//  eventour
//
//  Created by Rafael on 11/7/18.
//  Copyright © 2018 Rafael. All rights reserved.
//

import UIKit

import os

private let reuseIdentifier = "Cell"

class OrganizersViewController: UICollectionViewController {

    
    var organizers : [Organizer] = [Organizer]()
    var currentRow = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        eventourApi.getOrganizadores(
            responseHandler: handleResponse,
            errorHandler: handleError)

        
    }

    func handleResponse(organizadores: [Organizer]?){
        if let organizers = organizadores{
            
            self.organizers = organizers
            self.collectionView.reloadData()
        }
        
    }
    
    func handleError(error:Error){
        
        let message = "Error on Organizer Request:  \(error.localizedDescription)"
        
        os_log("%@",message)
        
    }
    
    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return organizers.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! OrganizerCell
    
        // Configure the cell
    
        cell.update(from : organizers[indexPath.row])
        return cell
        
    }

    // MARK: UICollectionViewDelegate

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showOrganizer" {
            let destination = segue.destination as! OrganizerViewController
            destination.organizer = organizers[currentRow]
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentRow = indexPath.row
        performSegue(withIdentifier: "showOrganizer", sender: self)
    }
}
