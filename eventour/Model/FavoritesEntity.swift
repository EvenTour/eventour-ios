//
//  FavoritesEntity.swift
//  eventour
//
//  Created by Rafael on 11/16/18.
//  Copyright © 2018 Rafael. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class FavoritesEntity {
    
    let entityName = "Favorite"

let delegate = UIApplication.shared.delegate as! AppDelegate

var context: NSManagedObjectContext = {
    
    return (UIApplication.shared.delegate as!
        AppDelegate).persistentContainer.viewContext
    
}()

func save(){
    
    
    delegate.saveContext()
}

func add(from event: Event) {
    guard find(for: event) == nil else {
        return
    }
    let description = NSEntityDescription.entity(forEntityName: entityName, in: context)
    let entity = NSManagedObject(entity: description!, insertInto: context)
    entity.setValue(event.id, forKey: "eventId")
    entity.setValue(event.event_name, forKey: "eventName")
    save()
}

func delete(for event: Event) {
    if let favorite = find(for: event) {
        context.delete(favorite)
        save()
    }
}

func all() -> [NSManagedObject]? {
    return find(withPredicate: nil)
}

func find(for event: Event) -> NSManagedObject? {
    let predicate = NSPredicate(format: "eventId = %@", String(event.id!))
    if let result = find(withPredicate: predicate) {
        return result.first
    }
    return nil
}

func find(withPredicate predicate: NSPredicate?) -> [NSManagedObject]? {
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
    if let predicate = predicate {
        request.predicate = predicate
    }
    do {
        let result = try context.fetch(request)
        return result as? [NSManagedObject]
    } catch {
        print("Error while fetching: \(error.localizedDescription)")
    }
    return nil
    
}

func eventIdsAsString() -> String? {
    if let favorites = all() {
        return favorites.map({$0.value(forKey: "eventId") as! String}).joined()
    }
    return nil
}

}
