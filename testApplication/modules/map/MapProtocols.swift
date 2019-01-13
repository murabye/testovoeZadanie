//
//  MapProtocols.swift
//  testApplication
//
//  Created by варя on 09/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import UIKit

protocol MapPresenterProtocol: class {
    func set(product: Product)
    func viewDidLoad()
}

protocol MapModelProtocol: class {
    func set(product: Product)
    func getProduct() -> Product
}

protocol MapViewProtocol: class {
    func show(lat: Double, long: Double, title: String, subTitle: String)
}
