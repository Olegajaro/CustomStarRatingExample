//
//  StorageManager.swift
//  CustomStarRatingExample
//
//  Created by Олег Федоров on 22.01.2022.
//

import Foundation

enum UserDefaultKeys {
    static let keyForRating = "ratingKey"
}

class StorageManager {
        
    public static var rating: Double {
        get {
            return UserDefaults.standard.double(forKey: UserDefaultKeys.keyForRating)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: UserDefaultKeys.keyForRating)
            UserDefaults.standard.synchronize()
        }
    }
}
