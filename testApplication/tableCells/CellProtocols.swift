//
//  CellProtocol.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import UIKit

protocol CellModelProtocol: class {
    var presenter: CellPresenterProtocol! { get set }
}

protocol CellPresenterProtocol: class {
    var cellDelegate: CellViewProtocol? {get set}
    
    var identifier: String { get }
    func present()
}

protocol CellViewProtocol: class {
}
