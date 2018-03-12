//
//  PSIDataModel.swift
//  BookInventory
//
//  Copyright © 2018 NyeinEi. All rights reserved.
//

import Foundation
import ObjectMapper

class PSIDataModel: Mappable {
    var items: [ItemModel]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        items <- map["items"]
    }
}

class ItemModel: Mappable {
    var readings: ReadingsModel?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        readings <- map["readings"]
    }
}


class ReadingsModel: Mappable {
    var pm25_twenty_four_hourly: Pm25hourlyModel?
    var pm25_one_hourly:pm25onehourlyModel?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        pm25_twenty_four_hourly <- map["pm25_twenty_four_hourly"]
        pm25_one_hourly <- map["pm25_one_hourly"]
    }
}

class Pm25hourlyModel: Mappable {
    var west: Int?
    var national: Int?
    var east: Int?
    var central: Int?
    var south: Int?
    var north: Int?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        west <- map["west"]
        national <- map["national"]
        east <- map["east"]
        central <- map["central"]
        south <- map["south"]
        north <- map["north"]
    }
}

class pm25onehourlyModel: Mappable {
    var west: Int?
    var national: Int?
    var east: Int?
    var central: Int?
    var south: Int?
    var north: Int?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        west <- map["west"]
        national <- map["national"]
        east <- map["east"]
        central <- map["central"]
        south <- map["south"]
        north <- map["north"]
    }
}
