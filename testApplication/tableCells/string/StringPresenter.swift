//
//  BoolPresenter.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import Foundation

class StringPresenter: CellPresenterProtocol {
    
    weak var modelDelegate: StringModel!
    weak var cellDelegate: CellViewProtocol?
    
    var identifier: String  {
        get {
            return "string"
        }
    }
    
    init(from: StringModel) {
        modelDelegate = from
    }

    func present() {
        if cellDelegate is StringTableViewCell {
            unowned let stringDelegate = cellDelegate as! StringTableViewCell
            stringDelegate.configure(title: modelDelegate.value, detail: modelDelegate.description)
        }
    }
}

