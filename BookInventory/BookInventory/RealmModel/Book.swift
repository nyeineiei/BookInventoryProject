//
//  Book.swift
//  BookInventory
//
//  Copyright © 2018 NyeinEi. All rights reserved.


import Foundation
import RealmSwift

// MARK: Model
final class Book: Object {
    @objc dynamic var title = ""
    @objc dynamic var author = ""
    @objc dynamic var publisher = ""
    @objc dynamic var publishdate = ""
    
    override static func primaryKey() -> String? {
        return "title"
    }
}

