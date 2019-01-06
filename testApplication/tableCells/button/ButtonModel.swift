//
//  ButtonModel.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import Foundation

class ButtonModel: CellModelProtocol {
    var presenter: CellPresenterProtocol!
    
    let name: String
    let onTap: () -> ()
        
    init(_ newName: String, _ newOnTap: @escaping () -> ()) {
        name = newName
        onTap = newOnTap
        presenter = nil
        
        presenter = ButtonPresenter(from: self)
    }
}
