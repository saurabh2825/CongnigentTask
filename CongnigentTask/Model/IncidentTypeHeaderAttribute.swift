//
//  ElementContentViewController.swift
//  CongnigentTask
//
//  Created by vmoksha mobility on 21/09/17.
//  Copyright © 2017 saurabh suman. All rights reserved.
//

import UIKit
import ObjectMapper

class IncidentTypeHeaderAttribute: Mappable {
    
    var HeaderLabel         = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        HeaderLabel             <- map["HeaderLabel"]
        
    }
}
