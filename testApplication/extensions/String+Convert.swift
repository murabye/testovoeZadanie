//
//  STring+Convert.swift
//  testApplication
//
//  Created by варя on 13/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import Foundation

extension String {
    func toDouble() -> Double {
        let formatter = NumberFormatter()
        formatter.decimalSeparator = "."
        
        return Double(truncating: formatter.number(from: self)!)
    }
}
