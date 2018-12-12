//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Gabriel Blaine Palmer on 12/11/18.
//  Copyright © 2018 Caleb Hicks. All rights reserved.
//

import UIKit
import Foundation

class StoreItemController {
    
    static func fetchItems(matching query: [String : String], completion: @escaping ([StoreItem]?) -> Void) {
        
        let baseURL = URL(string: "https://itunes.apple.com/search?")!
        guard let searchURL = baseURL.withQueries(query) else {
            completion(nil)
            print("Unable to generate URL with queries")
            return
        }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        URLSession.shared.dataTask(with: searchURL) { (data, response, error) in
            let decoder = JSONDecoder()
            
            if let data = data {
                
                if let stuff: StoreItems = try? decoder.decode(StoreItems.self, from: data) {
                    completion(stuff.results)
                } else {
                    print("Unable to decode StoreItems")
                    completion(nil)
                    return
                }
                
            } else {
                print("No data recieved")
                print(error as Any)
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            
            }.resume()
    }
}

