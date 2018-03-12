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
    @IBOutlet weak var btnAdd: UIButton!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
        self.setupInterface()
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
    
    func setupInterface() {
        self.btnAdd.backgroundColor = .clear
        self.btnAdd.layer.cornerRadius = 10
        self.btnAdd.layer.borderWidth = 1
        self.btnAdd.layer.borderColor = UIColor.black.cgColor
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        //done button & cancel button
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        // add toolbar to textField
        txtPublishDate.inputAccessoryView = toolbar
        // add datepicker to textField
        txtPublishDate.inputView = datePicker
    }
    
    @objc func donedatePicker(){
        //For date formate
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        txtPublishDate.text = formatter.string(from: datePicker.date)
        //dismiss date picker dialog
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        //cancel button dismiss datepicker dialog
        self.view.endEditing(true)
    }

}
