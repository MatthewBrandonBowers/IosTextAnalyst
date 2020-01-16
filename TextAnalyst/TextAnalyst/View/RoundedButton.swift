//
//  RoundedButton.swift
//  Anti-Bullying
//
//  Created by Caleb Stultz on 8/28/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }

}
