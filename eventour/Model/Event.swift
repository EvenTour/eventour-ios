//
//  Event.swift
//  eventour
//
//  Created by Alumnos on 10/25/18.
//  Copyright © 2018 Rafael. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Event: Codable{
    var id : Int?
    var urlImage: String
    var event_name: String?
    var startDate: String?
    var endDate: String?
    var duration: Int?
    var createdAt: String?
    var updatedAt: String?
    var event_id: Int?

    
    
    
    func construct ( object : NSManagedObject) {
        
        self.id = Int(object.value(forKey: "eventId").debugDescription)
        self.event_name = object.value(forKey: "eventName").debugDescription
  
    }
    

    var isFavorite: Bool {
        get {
            return CatchUpStore.shared.isFavorite(event: self)
        }
        set {
            CatchUpStore.shared.setFavorite(newValue, for: self)
        }
    }


}


