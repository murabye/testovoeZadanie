//
//  Product.swift
//  testApplication
//
//  Created by варя on 05/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import UIKit

class Product: Decodable {
    let id: Int64
    var name: String
    var availableStock: Int
    var image: String
    var isFavorite: Bool
    var price: Int
    var city: String
    var description: String
    var latitude: Double
    var longitude: Double
}
