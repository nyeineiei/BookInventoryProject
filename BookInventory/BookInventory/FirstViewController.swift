//
//  FirstViewController.swift
//  BookInventory
//
//  Copyright © 2018 NyeinEi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var vwWeatherBanner: UIView!
    @IBOutlet weak var lblPSI: UILabel!
    @IBOutlet weak var lblPM25: UILabel!
    @IBOutlet weak var lblLowestTemp: UILabel!
    @IBOutlet weak var lblHighestTemp: UILabel!
    @IBOutlet weak var lblPSIDesc: UILabel!
    @IBOutlet weak var lblPM25Desc: UILabel!
    @IBOutlet weak var lbl24HrForecastDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        WSHelper.sharedInstance.get24HrPSI { (responseObject) in
            self.lblPSI.text = "\(responseObject)"
        }
        
        WSHelper.sharedInstance.getPM25 { (responseObject) in
            let myArr = [responseObject.east, responseObject.west, responseObject.central, responseObject.north, responseObject.south]
            let min = self.findMin(myArr: myArr)
            let max = self.findMax(myArr: myArr)
            self.lblPM25.text = "\(min) \("-") \(max)"
        }
        
        WSHelper.sharedInstance.get24HrWeatherForecast { (responseObject) in
            if(responseObject != nil){
                let tempModel = responseObject;
                let low = "\(tempModel.low ?? 0)"
                let high = "\(tempModel.high ?? 0)"
                self.lblLowestTemp.text = NSString(format:"\(low)%@" as NSString, "\u{00B0}") as String
                self.lblHighestTemp.text = NSString(format:"\(high)%@" as NSString, "\u{00B0}") as String
            }
        }
    }
    
    
    func setupInterface(){
        self.lblPSIDesc.font = UIFont.boldSystemFont(ofSize: 20.0)
        self.lblPM25Desc.font = UIFont.boldSystemFont(ofSize: 20.0)
        self.lbl24HrForecastDesc.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        self.vwWeatherBanner.layer.shadowOpacity = 0.8
        self.vwWeatherBanner.layer.borderWidth = 1
        self.vwWeatherBanner.layer.borderColor = UIColor.black.cgColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func findMax(myArr:[Int?]) -> Int {
        var myMax = 0
        for i in 0...myArr.count - 1 {
            if (myArr[i]! > myMax){
                myMax = myArr[i]!
            }
        }
        return myMax
    }
    
    func findMin(myArr:[Int?]) -> Int {
        var myMin = myArr[0]
        for i in 0...myArr.count - 1 {
            if (myArr[i]! < myMin!){
                myMin = myArr[i]!
            }
        }
        return myMin!
    }
    
}

