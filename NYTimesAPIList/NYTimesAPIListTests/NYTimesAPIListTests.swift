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
    var objArticle: Article?
    
    override func setUpWithError() throws {
        list = ArticleVM()
        objArticle = Article(title: "abc", byline: "byline", published_date: "date", url: ".com", multimedia: [MultiMedia(url: "url")])
    }
    
    override func tearDownWithError() throws {
        list = nil
    }
    
    func testAddArticle() {
        list?.addArticle(article: objArticle ?? Article())
        XCTAssertEqual(list?.getArticleCount(), 1)
    }
    
    func testGetArticle() {
        list?.addArticle(article: objArticle ?? Article())
        XCTAssertEqual(list?.getArticle(at: 0).title, "abc")
    }
    
    func testPopulateArticles() throws {
        var articleCount: Int?
        list?.populateArticles(url: "https://api.nytimes.com/svc/topstories/v2/arts.json?api-key=aDFfPYP6tsmCYHNdOPUcNqPCvus1O4Ed")
        let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
            articleCount = self.list?.getArticleCount() ?? -1
            XCTAssertGreaterThan(articleCount!, 0)
        }
    }
    
    func testGetArticleCount() {
        list?.addArticle(article: objArticle ?? Article())
        XCTAssertEqual(list?.getArticleCount(), 1)
    }
    
    func testGetImage() {
        let image = list?.getImage(url: URL(string: "https://pixabay.com/photos/marguerite-daisy-flower-white-729510")!)
        XCTAssertNotNil(image)
    }
}
