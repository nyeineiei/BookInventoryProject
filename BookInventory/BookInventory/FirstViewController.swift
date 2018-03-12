//
//  FirstViewController.swift
//  BookInventory
//
//  Copyright © 2018 NyeinEi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WSHelper.sharedInstance.get24HrPSI { (responseObject) in
            print(responseObject)
        }
        
        WSHelper.sharedInstance.getPM25 { (responseObject) in
            let myArr = [responseObject.east, responseObject.west, responseObject.central, responseObject.north, responseObject.south]
            print(myArr)
        }
        
        WSHelper.sharedInstance.get24HrWeatherForecast { (responseObject) in
            print(responseObject)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

