//
//  SymptomsTable.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/13/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation

public let symptomNames = ["Nausea", "Diarrhea", "Hair Loss", "Bloating", "Headaches", "Fatigue", "Muscle Pain", "Blood Disorders", "Constipation", "Mouth and throat sores"]


let rd0 = ["Currently not experiencing this symptom", "Loss of appetite without alteration in eating habits", "Oral intake decreased without significant weight loss, dehydration or malnutrition", "Inadequate oral caloric or fluid intake; tube feeding, TPN, or hospitalization indicated"]
let s0 = Symptom(name: symptomNames[0], rating: 2, maxRating: 3, ratingDescriptions: rd0, otcSuggestions: "Antiemetics, such as Emetrol, Imodium, Pepto-Bismol")


var symptoms = [s0]
