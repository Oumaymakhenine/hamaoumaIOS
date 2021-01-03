//
//  Ordonnance.swift
//  HealthSheet
//
//  Created by Hama on 12/6/20.
//

import Foundation
class Ordonnance : Codable{
    internal init( medicaments: String) {
        self._id = ""
        self.medicaments = medicaments
    }
    
   var _id:String
  var  medicaments:String
}
