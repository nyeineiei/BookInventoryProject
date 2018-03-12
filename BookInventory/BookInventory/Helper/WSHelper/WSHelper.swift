//
//  WSHelper.swift
//  BookInventory
//
//  Copyright © 2018 NyeinEi. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class WSHelper {
    // Declare class instance property
    static let sharedInstance = WSHelper()
    
    // Declare an initializer
    // Because this class is singleton only one instance of this class can be created
    init() {
        print("WSHelper has been initialized")
    }
    
    func get24HrPSI(completionHandler:@escaping (Int) -> ()){
        Alamofire.request("https://api.data.gov.sg/v1/environment/psi").responseObject { (response: DataResponse<PSIDataModel>) in
            let weatherResponse = response.result.value
            completionHandler((weatherResponse?.items?.first?.readings?.pm25_twenty_four_hourly?.central)!)
        }
    }
    
    func getPM25(completionHandler:@escaping (pm25onehourlyModel) -> ()){
        Alamofire.request("https://api.data.gov.sg/v1/environment/pm25").responseObject { (response: DataResponse<PSIDataModel>) in
            let weatherResponse = response.result.value
            completionHandler((weatherResponse?.items?.first?.readings?.pm25_one_hourly)!)
        }
    }
    
    func get24HrWeatherForecast(completionHandler:@escaping (TemperatureModel) -> ()){
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        print(result)
        
        var urlString: String = "https://api.data.gov.sg/v1/environment/24-hour-weather-forecast"
        //urlString = urlString.appending("?date=" + result)
        Alamofire.request(urlString).responseObject { (response: DataResponse<TemperatureDataModel>) in
            let temperatureResponse = response.result.value
            if(temperatureResponse?.items?.count != 0){
                completionHandler((temperatureResponse?.items?.first?.general?.temperature)!)
            }
        }
    }
}
