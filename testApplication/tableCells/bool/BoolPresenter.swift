//
//  BoolPresenter.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import Foundation

class BoolPresenter: CellPresenterProtocol {
    
    weak var modelDelegate: BoolModel!
    weak var cellDelegate: CellViewProtocol?
    
    var identifier: String  {
        get {
            return "bool"
        }
    }
    
    init(from: BoolModel) {
        modelDelegate = from
    }
    
    
    func present() {
        if cellDelegate is BoolTableViewCell {
            unowned let boolDelegate = cellDelegate as! BoolTableViewCell
            boolDelegate.configure(title: modelDelegate.description, state: modelDelegate.value)
        }
    }
}
