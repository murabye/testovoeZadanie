//
//  ButtonPresenter.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import Foundation

class ButtonPresenter: CellPresenterProtocol {
    
    weak var modelDelegate: ButtonModel!
    weak var cellDelegate: CellViewProtocol?
    
    var identifier: String  {
        get {
            return "button"
        }
    }
    
    init(from: ButtonModel) {
        modelDelegate = from
    }
    
    func present() {
        if cellDelegate is ButtonTableViewCell {
            unowned let buttonDelegate = cellDelegate as! ButtonTableViewCell
            buttonDelegate.configure(name: modelDelegate.name, tap: modelDelegate.onTap)
        }
    }
}
