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
    
    private var products: AllProducts?
    
    init() {
        presenterDelegate = nil
    }
    
    //MARK: data work
    func updateData(_ newProducts: AllProducts) {
        products = newProducts
        presenterDelegate?.updateProductList(newProducts.productCollection)
    }
    
    func getData() -> [Product] {
        return products?.productCollection ?? []
    }
}
