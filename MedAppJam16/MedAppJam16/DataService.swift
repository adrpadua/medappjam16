//
//  DataService.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/15/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

let DB_BASE = FIRDatabase.database().reference()
let STORAGE_BASE = FIRStorage.storage().reference()

class DataService {
    
    static let ds = DataService()
    
    // DB references
    var REF_BASE = DB_BASE
    var user = User(name: "Sarah Connor", currentSymptoms: [], currentTreatments: [t0], doctor: doc0)
    
    
}

internal class Channel {
    internal let id: String
    internal let name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
