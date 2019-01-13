//
//  MainPresenter.swift
//  testApplication
//
//  Created by варя on 06/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import UIKit

class MainPresenter: MainPresenterProtocol {
    
    let model = MainModel()
    weak var viewDelegate: MainViewProtocol?
    
    var sections: [Section] = []
    
    init() {
        model.presenterDelegate = self
        NetworkManager.shared.getProducts(onSuccess: model.updateData(_:), onExeption: handleError(_:))
    }
    
    func handleError(_ error: Error) {
       viewDelegate?.handleError(error)
    }
    
    func updateProductList(_ products: [Product]) {
        sections = []
        
        let group = DispatchGroup()
        for product in products {
            group.enter()
            NetworkManager.shared.loadImage(from: product.image) {[unowned self] (image) in
                group.leave()
                
                let section = Section()
                section.cells.append(StringModel(String(product.id), "id"))
                section.cells.append(StringModel(product.name, "Название"))
                section.cells.append(StringModel(String(product.price), "Цена"))
                section.cells.append(StringModel(product.city, "Город"))
                section.cells.append(BoolModel(product.isFavorite, "В закладках"))
                section.cells.append(ImageModel(image))
                section.cells.append(ButtonModel("Найти на карте", {
                    let module = MapView.createModule()
                    self.viewDelegate?.present(viewController: module)
                    
                    module.presenter.set(product: product)
                }))
                
                self.sections.append(section)
            }
        }
        
        group.notify(queue: .main) { [unowned self] () in
            self.viewDelegate?.updateData(models: self.sections)
        }
    }
}
