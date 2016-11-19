//
//  Symptom.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/13/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation

class Symptom {
    var name = ""
    var rating = 0
    var maxRating = 0
    
    var ratingDescriptions: [String] = []
    var possibleCauses: [String] = []
    var otcSuggestions = ""
    
    init() {
        
    }
    
    init(name: String, rating: Int, maxRating: Int, ratingDescriptions: [String], possibleCauses: [String], otcSuggestions: String) {
        self.name = name
        self.rating = rating
        self.maxRating = maxRating
        self.ratingDescriptions = ratingDescriptions
        self.possibleCauses = possibleCauses
        self.otcSuggestions = otcSuggestions
    }
    
    public func addRating() {
        if rating + 1 > maxRating {
            return
        }
        rating += 1
    }
    
    public func minusRating() {
        if rating - 1 < 0 {
            return
        }
        rating -= 1
    }
}
