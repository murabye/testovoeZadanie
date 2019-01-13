//
//  MapModel.swift
//  testApplication
//
//  Created by варя on 09/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import Foundation

class MapModel: MapModelProtocol {
    weak var presenterDelegate: MapPresenterProtocol?
    var product: Product!
    
    func set(product: Product) {
        self.product = product
    }
    
    func getProduct() -> Product {
        return product
    }
}
