//
//  Helper.swift
//  BookInventory
//
//  Copyright © 2018 NyeinEi. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    // Declare class instance property
    static let sharedInstance = Helper()
    
    // Declare an initializer
    // Because this class is singleton only one instance of this class can be created
    init() {
        print("Helper has been initialized")
    }
    
    func showErrorMsg(error_msg_title: String, error_msg: String, controller:UIViewController){
        let alertController = UIAlertController(title: error_msg_title, message: error_msg, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
        alertController.addAction(okAction)
        controller.present(alertController, animated: true, completion: nil)
        
    }
}


