//
//  ThirdViewController.swift
//  BookInventory
//
//  Copyright © 2018 NyeinEi. All rights reserved.
//

import UIKit
import RealmSwift

class ThirdViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var books:Results<Book>!
    @IBOutlet weak var tblBookList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "BookListCell", bundle: nil)
        self.tblBookList.register(nib, forCellReuseIdentifier: "BookListCell")
        self.tblBookList.delegate = self;
        self.tblBookList.dataSource = self;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        //Get all data from realm.
        books = RealmHelper.sharedInstance.getAllBooks()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookListCell", for: indexPath) as! BookListCell
        
        let book:Book = books[indexPath.row]
        
        cell.lblTitle.text = book.title
        cell.lblAuthor.text = book.author
        cell.lblPublisher.text = book.publisher
        cell.lblPublishDate.text = book.publishdate
        
        return cell
    }
    
}
