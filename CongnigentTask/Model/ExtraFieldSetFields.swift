//
//  ElementContentViewController.swift
//  CongnigentTask
//
//  Created by vmoksha mobility on 21/09/17.
//  Copyright © 2017 saurabh suman. All rights reserved.
//

import UIKit
import ObjectMapper

class ExtraFieldSetFields: Mappable {
    
    var fieldName         = ""
    var fieldType         = ""
    var required         = false
    var length         = ""
    var format         = ""
    var defaultValue         = ""
    var isReadOnly         = ""
    var isVisible         = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
         fieldName             <- map["fieldName"]
         fieldType             <- map["fieldType"]
         required             <- map["required"]
         length             <- map["length"]
         format             <- map["format"]
         defaultValue             <- map["defaultValue"]
         isReadOnly             <- map["isReadOnly"]
         isVisible             <- map["isVisible"]
        
    }
}
