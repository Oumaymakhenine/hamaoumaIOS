//
//  Visite.swift
//  HealthSheet
//
//  Created by Hama on 12/6/20.
//

import Foundation
class Visite : Codable {
    internal init(_id: String, ordonnance: Ordonnance, analyse: Analyse) {
        self._id = _id
        self.ordonnance = ordonnance
        self.analyse = analyse
    }
    
    
    var _id:String
    var ordonnance:Ordonnance
    var analyse:Analyse
}
