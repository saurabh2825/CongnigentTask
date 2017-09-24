//
//  ElementContentViewController.swift
//  CongnigentTask
//
//  Created by vmoksha mobility on 21/09/17.
//  Copyright © 2017 saurabh suman. All rights reserved.
//

import UIKit
import ObjectMapper

class MainModel: Mappable {
    
    var IncidentType        : DataModel?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        IncidentType             <- map["IncidentType"]
    }
}
