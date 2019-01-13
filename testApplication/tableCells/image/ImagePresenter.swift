//
//  ImagePresenter.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import UIKit

class ImagePresenter: CellPresenterProtocol {
    
    weak var modelDelegate: ImageModel!
    weak var cellDelegate: CellViewProtocol?
    
    var identifier: String  {
        get {
            return "image"
        }
    }
    
    init(from: ImageModel) {
        modelDelegate = from
    }
    
    func present() {
        if cellDelegate is ImageTableViewCell {
            unowned let imageDelegate = cellDelegate as! ImageTableViewCell
            imageDelegate.configure(img: modelDelegate.value)
        }
    }
}
