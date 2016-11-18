//
//  User.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/15/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation

class User {
    var name = ""
    
    var currentSymptoms: [Symptom] = []
    var currentTreatments: [Treatment]
    
    var doctor: Doctor = Doctor()
    
    init(name: String, currentSymptoms: [Symptom], currentTreatments: [Treatment], doctor: Doctor) {
        self.name = name
        
        self.currentSymptoms = currentSymptoms
        self.currentTreatments = currentTreatments
        
        self.doctor = doctor
    }
    
    var possibleSymptoms: [Symptom] {
        get {
            var list: [Symptom] = []
            
            for treatment in currentTreatments {
                for symptom in treatment.commonSymptoms {
                    list.append(symptom)
                }
            }
            
            return list
        }
    }
    
    public func updateAddSymptom(symptom: Symptom) {
        
        if currentSymptoms.count != 0 {
            for index in 0...currentSymptoms.count - 1 {
                if (currentSymptoms[index].name == symptom.name) {
                    currentSymptoms[index].rating = symptom.rating
                    return;
                }
            }
        }
        
        
        // if not found, add new
        print("Adding \(symptom.name)")
        currentSymptoms.append(symptom)
    }
    
    public func has(symptomName: String) -> Bool {
        for index in 0...currentSymptoms.count - 1 {
            if (currentSymptoms[index].name == symptomName) {
                return true
            }
        }
        return false
    }
}
