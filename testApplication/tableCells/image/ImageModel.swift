//
//  ImageModel.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import UIKit

class ImageModel: CellModelProtocol {
    var presenter: CellPresenterProtocol!
    
    let value: UIImage
        
    init(_ newValue: UIImage) {
        value = newValue
        presenter = nil
        presenter = ImagePresenter(from: self)
    }
}
