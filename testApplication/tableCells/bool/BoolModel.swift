//
//  BoolModel.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import Foundation

class BoolModel: CellModelProtocol {
    let value: Bool
    let description: String
    
    var presenter: CellPresenterProtocol!

    init(_ newValue: Bool, _ newDescription: String) {
        value = newValue
        description = newDescription
        presenter = nil
        presenter = BoolPresenter(from: self)
    }
}
