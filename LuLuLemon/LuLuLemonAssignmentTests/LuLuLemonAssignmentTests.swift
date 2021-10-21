//
//  LuLuLemonAssignmentTests.swift
//  LuLuLemonAssignmentTests
//
//  Created by Ethan Rockel on 10/13/21.
//

import XCTest
@testable import LuLuLemonAssignment

class LuLuLemonAssignmentTests: XCTestCase {
    var list: ListVM?
    var add: AddVM?
    
    override func setUp() {
        list = ListVM()
        add = AddVM()
    }
    
    override func tearDown() {
        list = nil
        add = nil
    }
    
    func testListVMGetCount() {
        let list = ListVM()
        list.garmentList = [Garment(), Garment()]
        XCTAssertEqual(list.getGarmentListCount(), 2)
    }
    
    func testFetchGarmentList() {
        list?.fetchGarmentList(sortType: Constants.ALPHA.rawValue)
        XCTAssertNotNil(list?.garmentList)
    }
    
    func testDeleteGarment() {
        add?.saveGarment(name: "yo")
        list?.fetchGarmentList(sortType: Constants.ALPHA.rawValue)
        let count = list?.getGarmentListCount() ?? -1
        list?.deleteGarment(at: count - 1)
        XCTAssertLessThan(list?.getGarmentListCount() as! Int, count)
    }
    
    func testGetGarment() {
        add?.saveGarment(name: "zzz")
        list?.fetchGarmentList(sortType: 0)
        let count = list?.getGarmentListCount() ?? -1
        let name = list?.getGarment(at: count - 1).name
        list?.deleteGarment(at: count - 1)
        XCTAssertEqual(name, "zzz")
    }
    
    func testGetGarmentListCount() {
        add?.saveGarment(name: "yo")
        list?.fetchGarmentList(sortType: Constants.ALPHA.rawValue)
        let count = list?.getGarmentListCount() ?? -1
        list?.deleteGarment(at: count - 1)
        XCTAssertLessThan(list?.getGarmentListCount() as! Int, count)
    }

}
