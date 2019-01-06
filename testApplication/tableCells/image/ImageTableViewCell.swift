//
//  ImageTableViewCell.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    func configure(img: UIImage) {
        imgView.image = img
    }
}
