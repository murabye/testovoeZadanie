//
//  Product.swift
//  testApplication
//
//  Created by варя on 05/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import UIKit

struct Product: Decodable {
    let id: Int64
    var name: String
    var availableStock: Int
    var image: String
    var isFavorite: Bool
    var price: Int
    var city: String
    var description: String
    var latitude: String
    var longitude: String
    
    var latitudeConv: Double? {
        get {
            return latitude.toDouble()
        }
    }
    var longitudeConv: Double?{
        get {
            return longitude.toDouble()
        }
    }
}
