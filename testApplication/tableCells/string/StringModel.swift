//
//  StringView.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import Foundation

class StringModel: CellModelProtocol {
    var presenter: CellPresenterProtocol!
    
    let value: String
    let description: String
    
    init(_ newValue: String, _ newDescription: String) {
        value = newValue
        description = newDescription
        presenter = nil
        presenter = StringPresenter(from: self)
    }
}
