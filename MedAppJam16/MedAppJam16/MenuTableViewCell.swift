//
//  MenuTableViewCell.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/13/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(name: String, color: UIColor) {
        layer.backgroundColor = color.cgColor
        nameLabel.text = name
    }

}
