//
//  RoundedButton.swift
//  MedAppJam16
//
//  Created by Adrian Padua on 11/9/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        clipsToBounds = true
        layer.cornerRadius = 5
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.white.cgColor
    }

}
