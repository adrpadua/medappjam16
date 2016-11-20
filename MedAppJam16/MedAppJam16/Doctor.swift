//
//  Doctor.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/15/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation

class Doctor {
    var name = ""
    var hospital = ""
    var address = ""
    
    init() {
        
    }
    
    init(name: String, hospital: String, address: String) {
        self.name = name
        self.hospital = hospital
        self.address = address
    }
}
