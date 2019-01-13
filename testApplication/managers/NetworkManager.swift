//
//  NetworkManager.swift
//  testApplication
//
//  Created by варя on 05/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import UIKit

class NetworkManager {
    private enum Addresses: String {
        case getProductList = "https://api.myjson.com/bins/vk6qe"
    }
    
    static let shared = NetworkManager()
    private init() {}
    
    static func baseErrorHandler(error: Error) {
        print(error)
    }
    
    private func baseGetRequest(address: Addresses, onEnd: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let url = URL(string: address.rawValue)!
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                NetworkManager.baseErrorHandler(error: error!)
            }
            onEnd(data, response, error)
        }.resume()
    }
    
    func getProducts(onSuccess: @escaping ([Product]) -> Void, onExeption: @escaping (Error) -> Void) {
        baseGetRequest(address: .getProductList) { (data, response, requestError) in
            guard let data = data else { return }
            
            do {
                let dec = JSONDecoder()
                dec.keyDecodingStrategy = .convertFromSnakeCase
                
                let products = try dec.decode([Product].self, from: data)
                
                DispatchQueue.main.async {
                    onSuccess(products)
                }
            } catch {
                DispatchQueue.main.async {
                    onExeption(error)
                }
            }
        }
    }
    
    func loadImage(from link: String, onSuccess: @escaping (UIImage) -> ()) {
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                onSuccess(image)
            }
        }.resume()
    }

}
