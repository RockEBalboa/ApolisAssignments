//
//  ArticleVM.swift
//  NYTimesAPIList
//
//  Created by Ethan Rockel on 10/15/21.
//

import Foundation
import UIKit

class ArticleVM {
    private var articles = [Article]()
    let api = APIHandler()
    var refreshUI: (()->())?
    
    
    func populateArticles(url: String) {
        api.fetchData(url: url)
        api.dataPass = { arr in
            self.articles = arr
            self.refreshUI?()
        }
    }
    
    func getArticle(at: Int) -> Article {
        return articles[at]
    }
    
    func getArticleCount() -> Int {
        return articles.count
    }
    
    func getImage(url: URL) -> UIImage {
        var img: UIImage?
        api.imgPass = { i in
            img = i
        }
        return img ?? UIImage()
    }
    
    func addArticle(article: Article) {
        articles.append(article)
    }
}
