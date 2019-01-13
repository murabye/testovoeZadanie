//
//  MapPresenter.swift
//  testApplication
//
//  Created by варя on 09/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import Foundation

class MapPresenter: MapPresenterProtocol {
    
    var model: MapModel!
    weak var viewDelegate: MapViewProtocol?
    
    func set(product: Product) {
        model.set(product: product)
    }
    
    func viewDidLoad() {
        let product = model.getProduct()
        viewDelegate?.show(lat: product.latitudeConv!,
                           long: product.longitudeConv!,
                           title: product.name,
                           subTitle: product.city)
    }
}
