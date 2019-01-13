
//
//  MainPresenterProtocol.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import UIKit

protocol MainPresenterProtocol: class {
    func updateProductList(_: [Product])
    func handleError(_: Error)
}

protocol MainModelProtocol: class {
    func getData() -> [Product]
}

protocol MainViewProtocol: class {
    func handleError(_: Error)
    func updateData(models: [Section])
    func present(viewController: UIViewController)
}
