//
//  AddVM.swift
//  LuLuLemonAssignment
//
//  Created by Ethan Rockel on 10/17/21.
//

import Foundation

class AddVM {
    
    /**
        Function will save the garment to local storage
     */
    func saveGarment(name: String) {
        let garment = Garment(context: Database.db.context)
        garment.name = name
        garment.timeCreated = Date()
        Database.db.addGarment(garment: garment)
    }
}
