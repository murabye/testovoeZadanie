//
//  ButtonTableViewCell.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    @IBOutlet weak var button: UIButton!
    var onTap: (() -> ())?
    
    @IBAction func mainAction(_ sender: Any) {
        if onTap != nil {
            onTap!()
        }
    }
    
    func configure(name: String, tap: @escaping () -> ()) {
        onTap = tap
        button.setTitle(name, for: .normal)
    }
}
