//
//  DatabaseAPI.swift
//  LuLuLemonAssignment
//
//  Created by Ethan Rockel on 10/14/21.
//

import UIKit
import Foundation
import CoreData


class Database {
    static let db = Database()
    private init() {}
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchGarmentList(sortingType: NSSortDescriptor) -> [Garment]{
        var garmentList = [Garment]()
        
        do {
            let req = Garment.fetchRequest() as NSFetchRequest<Garment>
            req.sortDescriptors = [sortingType]
            garmentList = try self.context.fetch(req)
        } catch let err as NSError {
            print("Fetching Error: \(err)")
        }
        return garmentList
    }
    
    func deleteGarment(garment: Garment) {
        self.context.delete(garment)
        do {
            try self.context.save()
        } catch let err as NSError {
            print("Fetching Error: \(err)")
        }
    }
    
    func addGarment(garment: Garment) {
        self.context.insert(garment)
        do {
            try self.context.save()
        } catch let err as NSError {
            print("Fetching Error: \(err)")
        }
    }
}
