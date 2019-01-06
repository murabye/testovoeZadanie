//
//  MainPresenter.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    
    let model = MainModel()
    weak var viewDelegate: MainViewProtocol?
    
    init() {
        model.presenterDelegate = self
        NetworkManager.shared.getProducts(onSuccess: model.updateData(_:), onExeption: handleError(_:))
    }
    
    func handleError(_ error: Error) {
       viewDelegate?.handleError(error)
    }
    
    func updateProductList(_ products: [Product]) {
        var sections: [Section] = []
        
        for product in products {
            let section = Section()
            section.cells.append(StringModel(String(product.id), "id"))
            section.cells.append(StringModel(product.name, "Название"))
            section.cells.append(StringModel(String(product.price), "Цена"))
            section.cells.append(StringModel(product.city, "Город"))
            section.cells.append(BoolModel(product.isFavorite, "В закладках"))
            section.cells.append(ImageModel(product.image))
            section.cells.append(ButtonModel("Найти на карте", {
                
            }))
            
            sections.append(section)
        }
        
        viewDelegate?.updateData(models: sections)
    }
}
