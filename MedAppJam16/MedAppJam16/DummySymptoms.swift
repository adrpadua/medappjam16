//
//  SymptomsTable.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/13/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation

public let symptomNames = ["Nausea", "Diarrhea", "Hair Loss", "Fatigue", "Anemia", "Blood Disorders", "Constipation", "Mouth and throat sores"]


let rd0 = ["Currently not experiencing this symptom", "Loss of appetite without alteration in eating habits", "Oral intake decreased without significant weight loss, dehydration or malnutrition", "Inadequate oral caloric or fluid intake; tube feeding, TPN, or hospitalization indicated"]
let pc0 = ["Post-surgery recovery", "Cyclophosphamide", "Alemtuzumab", "Altretamine", "Busulfan", "Dactinomycin"]
let s0 = Symptom(name: symptomNames[0], rating: 0, maxRating: 3, ratingDescriptions: rd0, possibleCauses: pc0, otcSuggestions: "Antiemetics, such as Emetrol, Imodium, Pepto-Bismol")

let rd1 = ["Currently not experiencing this symptom", "Increase of <4 stools per day over baseline; mild increase in ostomy output compared to baseline", "Increase of 4 - 6 stools per day over baseline; moderate increase in ostomy output compared to baseline", "Increase of >=7 stools per day over baseline; incontinence; hospitalization indicated; severe increase in ostomy output compared to baseline"]
let pc1 = ["Post-surgery recovery", "Actinomycin", "Altretamine", "Bortezomib", "Capecitabine", "Floxuridine"]
let s1 = Symptom(name: symptomNames[1], rating: 0, maxRating: 3, ratingDescriptions: rd1, possibleCauses: pc1, otcSuggestions: "Drink clear liquids, Eat low-fiber foods, Increase potassium intake")

let rd2 = ["Currently not experiencing this symptom", "Hair loss of <50% of normal for that individual that is not obvious from a distance but only on close inspection", "Hair loss of >=50% normal for that individual that is readily apparent to others"]
let pc2 = ["Altretamine", "Carboplatin", "Cyclophosphamide", "Doxorubicin"]
let s2 = Symptom(name: symptomNames[2], rating: 0, maxRating: 2, ratingDescriptions: rd2, possibleCauses: pc2, otcSuggestions: "A wig or hair piece is necessary if the patient desires to completely camouflage the hair loss")

let rd3 = ["Currently not experiencing this symptom", "Fatigue relieved by rest", "Fatigue not relieved by rest; limiting instrumental daily living", "Fatigue not relieved by rest, limiting self care"]
let pc3 = ["Radiation therapy", "Alemtuzumab"]
let s3 = Symptom(name: symptomNames[3], rating: 0, maxRating: 3, ratingDescriptions: rd3, possibleCauses: pc3, otcSuggestions: "Stay well rested and do not exert yourself too hard")


let rd4 = ["Currently not experiencing this symptom", "Hemoglobin (Hgb) <LLN - 10.0 g/dL; <LLN - 6.2 mmol/L; <LLN - 100 g/L", "Hgb <10.0 - 8.0 g/dL; <6.2 - 4.9 mmol/L;  <100 - 80g/L", "Hgb <8.0 g/dL; <4.9 mmol/L; <80 g/L; transfusion indicated"]
let pc4 = ["Flourouracil"]
let s4 = Symptom(name: symptomNames[4], rating: 0, maxRating: 3, ratingDescriptions: rd3, possibleCauses: pc3, otcSuggestions: "Stay well rested and do not exert yourself too hard")


var symptoms = [s0, s1, s2, s3]




// DRUGS/TREATMENTS
let d0 = Drug(name: "Cyclophosphamide", symptoms: [s0, s2])
let d1 = Drug(name: "Methotrexate", symptoms: [s0, s1, s2])
let d2 = Drug(name: "Flourouracil", symptoms: [s0, s1, s4])

let t0 = Treatment(name: "CMF Chemotherapy", drugs: [d0, d1, d2])
