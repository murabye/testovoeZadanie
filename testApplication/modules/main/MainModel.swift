//
//  MainModel.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import Foundation

class MainModel: MainModelProtocol {
    weak var presenterDelegate: MainPresenterProtocol?
    
    private var products: [Product] = []
    
    init() {
        presenterDelegate = nil
    }
    
    func updateData(_ newProducts: [Product]) {
        products = newProducts
        presenterDelegate?.updateProductList(newProducts)
    }
    
    func getData() -> [Product] {
        return products
    }
}
