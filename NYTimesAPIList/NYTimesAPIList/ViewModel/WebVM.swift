//
//  WebVM.swift
//  NYTimesAPIList
//
//  Created by Ethan Rockel on 10/15/21.
//

import Foundation


class WebVM {
    var article: Article?
    
    func setArticle(a: Article) {
        self.article = a
    }
    
    func getArticle() -> Article {
        return self.article ?? Article()
    }
}
