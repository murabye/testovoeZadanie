//
//  BoolTableViewCell.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import UIKit

class BoolTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stateSwitch: UISwitch!
    
    func configure(title: String, state: Bool) {
        titleLabel.text = title
        stateSwitch.isOn = state
    }
}
