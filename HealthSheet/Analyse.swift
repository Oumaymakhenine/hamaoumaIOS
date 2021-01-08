//
//  Analyse.swift
//  HealthSheet
//
//  Created by Hama on 12/6/20.
//

import Foundation
class Analyse :Codable {
    internal init(id: String,filename:String,doctor:String,patient:String) {
            self.id = id
            self.filename = filename
            self.doctor = doctor
            self.patient = patient
        }
        var doctor:String
        var patient:String
        var id:String
        var filename:String
}
