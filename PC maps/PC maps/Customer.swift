//
//  Customer.swift
//  PC maps
//
//  Created by Arthur Bandeira on 16/05/17.
//  Copyright © 2017 Arthur Bandeira. All rights reserved.
//
import RealmSwift
import ObjectMapper

import Foundation

class Customer : Object, Mappable{
    
    dynamic var id = 0
    dynamic var name : String? =  ""
    dynamic var email : String? = ""
    dynamic var observation : String? = ""
    dynamic var birthday : String? = ""
    
    override static func primaryKey()-> String?{
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init() 
    }
   
    func mapping(map: Map) {
        id          <- map["id"]
        name        <- map ["name"]
        email       <- map["email"]
        observation <- map["obs"]
        birthday    <- map["birthday"]
    }
}
