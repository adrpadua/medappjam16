//
//  MySymptomTableViewCell.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/14/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class MySymptomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(name: String, rating: Int, color: UIColor) {
        layer.backgroundColor = color.cgColor
        nameLabel.text = name
        ratingLbl.text = "Grade \(rating)"
    }
    
    func configureCell(symptom: Symptom, color: UIColor) {
        nameLabel.text = symptom.name
        ratingLbl.text = "Grade \(symptom.rating)"
    }

}
