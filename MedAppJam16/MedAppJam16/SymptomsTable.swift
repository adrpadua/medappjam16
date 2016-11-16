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
let pc0 = ["Chemotherapy Drugs", "Stress"]
let s0 = Symptom(name: symptomNames[0], rating: 2, maxRating: 3, ratingDescriptions: rd0, possibleCauses: pc0, otcSuggestions: "Antiemetics, such as Emetrol, Imodium, Pepto-Bismol")

let rd1 = ["Currently not experiencing this symptom", "Increase of <4 stools per day over baseline; mild increase in ostomy output compared to baseline", "Increase of 4 - 6 stools per day over baseline; moderate increase in ostomy output compared to baseline", "Increase of >=7 stools per day over baseline; incontinence; hospitalization indicated; severe increase in ostomy output compared to baseline"]
let pc1 = ["Radiation therapy", "Intestine-targeted chemotherapy", "Post-surgery"]
let s1 = Symptom(name: symptomNames[0], rating: 1, maxRating: 3, ratingDescriptions: rd1, possibleCauses: pc1, otcSuggestions: "Drink clear liquids, Eat low-fiber foods, Eat more potassium")


var symptoms = [s0, s1]

let d0 = Drug(name: "Cyclophosphamide", symptoms: [s0])
let d1 = Drug(name: "Methotrexate", symptoms: [s1])

let t0 = Treatment(name: "CMF Chemotherapy", drugs: [])
