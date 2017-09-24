//
//  DataModel.swift
//  Practice
//
//  Created by vmoksha mobility on 22/09/17.
//  Copyright © 2017 vmoksha mobility. All rights reserved.
//

import UIKit
import ObjectMapper

class DataModel: Mappable {
    
    var IncidentType         = ""
    var incidentTypeHeader : IncidentTypeHeaderAttribute?
    var callerInfoHeader : IncidentTypeHeaderAttribute?
    var interactonTypes = [ExtraFieldSetFields]()
    var callerInfo = [ExtraFieldSetFields]()
    var extraFields = [ExtraFieldSetFields]()
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        IncidentType             <- map["IncidentType"]
        incidentTypeHeader           <- map["IncidentTypeHeaderAttribute"]
        callerInfoHeader           <- map["IncidentTypeHeaderAttribute"]
        interactonTypes             <- map["Interaction Type"]
        callerInfo           <- map["Caller Information"]
        extraFields           <- map["ExtraFieldSetFields"]
    }
}





