//
//  TemperatureDataModel.swift
//  BookInventory
//
//  Copyright © 2018 NyeinEi. All rights reserved.
//

import Foundation
import ObjectMapper

class TemperatureDataModel: Mappable {
    var items: [ItemsModel]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        items <- map["items"]
    }
}

class ItemsModel: Mappable {
    var general: GeneralModel?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        general <- map["general"]
    }
}

class GeneralModel: Mappable {
    var temperature: TemperatureModel?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        temperature <- map["temperature"]
    }
}

class TemperatureModel: Mappable {
    var low: Int?
    var high: Int?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        low <- map["low"]
        high <- map["high"]
    }
}
