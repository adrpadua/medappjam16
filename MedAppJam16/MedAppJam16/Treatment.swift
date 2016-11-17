//
//  Treatment.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/15/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation

class Treatment {
    var name = ""
    var commonSymptoms: [Symptom] = []
    var drugs: [Drug] = []
    var drugNames: [String] = []
    
    init(name: String, drugs: [Drug]) {
        self.name = name
        self.drugs = drugs
        
        for drug in drugs {
            for symptom in drug.symptoms {
                if drugNames.contains(symptom.name) {
                    continue
                }
                drugNames.append(symptom.name)
                self.commonSymptoms.append(symptom)
            }
        }
    }
}

class Drug {
    var name = ""
    var symptoms: [Symptom] = []
    
    init(name: String, symptoms: [Symptom]) {
        self.name = name
        self.symptoms = symptoms
    }
}

extension Array {
    func contains<T>(obj: T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
}
