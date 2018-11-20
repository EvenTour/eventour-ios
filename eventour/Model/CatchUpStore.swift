//
//  CatchUpStore.swift
//  eventour
//
//  Created by Rafael on 11/16/18.
//  Copyright © 2018 Rafael. All rights reserved.
//

import Foundation


class CatchUpStore {
    
    static let shared = CatchUpStore()
    private init() {}
    
    let favoritesEntity = FavoritesEntity()
    
    func setFavorite(_ isFavorite: Bool, for event: Event) {
        if isFavorite == self.isFavorite(event: event) {
            return
        }
        if isFavorite {
            favoritesEntity.add(from: event)
        } else {
            favoritesEntity.delete(for: event)
        }
    }
    
    func isFavorite(event: Event) -> Bool {
        return favoritesEntity.find(for: event) != nil
    }
    
    func eventIdsAsString() -> String? {
        return favoritesEntity.eventIdsAsString()
    }
    
    
        
}

