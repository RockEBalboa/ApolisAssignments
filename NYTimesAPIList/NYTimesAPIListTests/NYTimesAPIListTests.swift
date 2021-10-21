//
//  NYTimesAPIListTests.swift
//  NYTimesAPIListTests
//
//  Created by Ethan Rockel on 10/15/21.
//

import XCTest
@testable import NYTimesAPIList
//import CoreMIDI

class NYTimesAPIListTests: XCTestCase {
    var list: ArticleVM?
    
    override func setUpWithError() throws {
        list = ArticleVM()
    }
    
    override func tearDownWithError() throws {
        list = nil
    }
    
    func testGetArticle() {
        list?.addArticle(article: Article(title: "woo"))
        XCTAssertEqual(list?.getArticle(at: 0).title, "woo")
    }
    
    func testPopulateArticles() throws {
        var articleCount: Int?
        list?.populateArticles(url: "https://api.nytimes.com/svc/topstories/v2/arts.json?api-key=aDFfPYP6tsmCYHNdOPUcNqPCvus1O4Ed")
//        articleCount = self.list?.getArticleCount() ?? -1

        let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
            articleCount = self.list?.getArticleCount() ?? -1
            XCTAssertGreaterThan(articleCount!, 0)
        }
    }
    
    func testGetArticleCount() {
        list?.addArticle(article: Article(title: "woo"))
        XCTAssertEqual(list?.getArticleCount(), 1)
    }
    
    func testGetImage() {
        let image = list?.getImage(url: URL(string: "https://pixabay.com/photos/marguerite-daisy-flower-white-729510")!)
        XCTAssertNotNil(image)
    }
}
