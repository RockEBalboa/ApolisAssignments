//
//  APIHandler.swift
//  NYTimesAPIList
//
//  Created by Ethan Rockel on 10/15/21.
//

import Foundation
import UIKit


class APIHandler {
    var dataPass: (([Article])->())?
    var imgPass: ((UIImage)->())?
    
    func fetchData(url: String) {
        let u = URL(string: url) ?? URL(fileURLWithPath: "")
        
        URLSession.shared.dataTask(with: u) { data, response, error in
            
            let arrResponse = try? JSONDecoder().decode(Result.self, from: data!)
            self.dataPass?(arrResponse?.results ?? [Article]())
        }.resume()
    }
    
    func retrieveImage(url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            let img = UIImage(data: data!)
            self.imgPass?(img ?? UIImage())
        }.resume()
    }
}
