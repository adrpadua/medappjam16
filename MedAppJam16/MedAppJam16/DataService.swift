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

class ChronoService {
    
    static let cs = ChronoService()
    
    let date = NSDate()
    var calendar: Calendar {
        return NSCalendar.current
    }
    
    var components: NSDateComponents {
        get {
            return calendar.dateComponents([.year, .month, .day, .hour], from: date as Date) as NSDateComponents
        }
    }
    
    var hour: Int {
        return calendar.component(.hour, from: date as Date)
    }
    var minutes: Int {
        return calendar.component(.minute, from: date as Date)
    }
    
    var timeStr: String {
        get {
            return "\(hour):\(minutes)"
        }
    }
    
    var year: Int {
        return components.year
    }
    var month: Int {
        return components.month
    }
    var day: Int {
        return components.day
    }
    
    var dateStr: String {
        get {
            return "\(month)/\(day)/\(year)"
        }
    }
    
    var dateTimeStr: String {
        return "\(self.dateStr) (\(self.timeStr))"
    }
}

internal class Channel {
    internal let id: String
    internal let name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
