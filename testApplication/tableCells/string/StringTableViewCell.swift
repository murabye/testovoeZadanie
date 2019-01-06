//
//  TextTableViewCell.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import UIKit

class StringTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    func configure(title: String, detail: String) {
        titleLabel.text = title
        detailLabel.text = detail
    }

}
