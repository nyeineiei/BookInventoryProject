//
//  SecondViewController.swift
//  BookInventory
//
//  Copyright © 2018 NyeinEi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtAuthor: UITextField!
    @IBOutlet weak var txtPublisher: UITextField!
    @IBOutlet weak var txtPublishDate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addBook(_ sender: Any) {
        let result:Bool = self.isValid()
        if(result){
            RealmHelper.sharedInstance.addBook(title: txtTitle.text!, author: txtAuthor.text!, publisher: txtPublisher.text!, publishDate: txtPublishDate.text!)
            Helper.sharedInstance.showErrorMsg(error_msg_title:"Save", error_msg: "Book has been added successfully.", controller: self)
            self.txtTitle.text = "";
            self.txtAuthor.text = "";
            self.txtPublisher.text = "";
            self.txtPublishDate.text = "";
        }
    }
    
    func isValid() -> Bool {
        if(txtTitle.text == ""){
            Helper.sharedInstance.showErrorMsg(error_msg_title:"Missing data", error_msg: "Please type title.", controller: self)
            return false
        }else if(txtAuthor.text == ""){
            Helper.sharedInstance.showErrorMsg(error_msg_title:"Missing data", error_msg: "Please type author.", controller: self)
            return false
        }else if(txtPublisher.text == ""){
            Helper.sharedInstance.showErrorMsg(error_msg_title:"Missing data", error_msg: "Please type publisher.", controller: self)
            return false
        }else if(txtPublishDate.text == ""){
            Helper.sharedInstance.showErrorMsg(error_msg_title:"Missing data", error_msg: "Please type publish date.", controller: self)
            return false
        }else{
            return true
        }
    }
}
