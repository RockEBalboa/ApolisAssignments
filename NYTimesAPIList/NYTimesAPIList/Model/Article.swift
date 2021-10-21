//
//  Article.swift
//  NYTimesAPIList
//
//  Created by Ethan Rockel on 10/15/21.
//

import Foundation

struct Article: Decodable {
    var title: String?
    var byline: String?
    var published_date: String?
    var url: String?
    var multimedia: [MultiMedia]?
    
    func translateDate(date: String) -> String {
        let originalDateFormatter = DateFormatter()
        originalDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let toDateFormatter = DateFormatter()
        toDateFormatter.dateFormat = "MMM dd, yyyy: HH:mm"
        return toDateFormatter.string(from: originalDateFormatter.date(from: date)!)
    }
}

struct Result: Decodable {
    var results: [Article]?
}

struct MultiMedia: Decodable {
    var url: String?
}
