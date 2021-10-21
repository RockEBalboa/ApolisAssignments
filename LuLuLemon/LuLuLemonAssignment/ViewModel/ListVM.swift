//
//  ListVM.swift
//  LuLuLemonAssignment
//
//  Created by Ethan Rockel on 10/17/21.
//

import Foundation

class ListVM {
    var garmentList = [Garment]()
    let db = Database.db
    
    func fetchGarmentList(sortType: Int) {
        var sort: NSSortDescriptor?
        switch sortType {
        case Constants.TIME_CREATED.rawValue:
            sort = NSSortDescriptor(key: "timeCreated", ascending: true)
        default:
            sort = NSSortDescriptor(key: "name", ascending: true)
        }
        
        garmentList = db.fetchGarmentList(sortingType: sort ?? NSSortDescriptor())
    }
    
    func deleteGarment(at: Int) {
        db.deleteGarment(garment: garmentList[at])
        garmentList.remove(at: at)
    }
    
    func getGarment(at: Int) -> Garment {
        if at < getGarmentListCount() {
            return garmentList[at]
        }
        return Garment()
    }
    
    func getGarmentListCount() -> Int {
        return garmentList.count
    }
}
