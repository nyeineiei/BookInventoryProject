//
//  RealmHelper.swift
//  BookInventory
//
//  Copyright © 2018 NyeinEi. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    // Declare class instance property
    static let sharedInstance = RealmHelper()
    
    // Declare an initializer
    // Because this class is singleton only one instance of this class can be created
    init() {
        print("RealmHelper has been initialized")
    }
    
    
    // Adding book to realm.
    func addBook(title: String, author: String, publisher: String, publishDate:String){
        let book = Book()
        book.title = title
        book.author = author
        book.publisher = publisher
        book.publishdate = publishDate
        
        // Get the default Realm
        let realm = try! Realm()
        print("Reaml URL: \(String(describing: realm.configuration.fileURL))")
        
        // Persist your data easily
        try! realm.write {
            realm.add(book, update: true)
            print("Book Title: \(book.title)")
        }
    }
    
    // Retrieving book from realm.
    func getAllBooks() -> Results<Book>{
        // Get the default Realm
        let realm = try! Realm()
        print("Reaml URL: \(String(describing: realm.configuration.fileURL))")
        
        let books = realm.objects(Book.self)
        return books;
    }
}
