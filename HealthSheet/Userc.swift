//
//  Userc.swift
//  HealthSheet
//
//

import Foundation
class Userc : Codable{
    internal init(username: String, visites: [Visite], roles: [Role], listdp: [Userc], _id: String, firstname: String, lastname: String, email: String, password: String, phonenum: String) {
        self.username = username
        self.visites = visites
        self.roles = roles
        self.listofdp = listdp
        self._id = _id
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
        self.phonenum = phonenum
    }
    
    internal init(username: String, password: String) {
        self.username = username
        self.visites =  []
        self.roles = []
        self.listofdp = []
        self._id = ""
        self.firstname = ""
        self.lastname = ""
        self.email = ""
        self.password = password
        self.phonenum = ""
    }
  
    
    

    var username:String
    var visites:[Visite]
    var roles:[Role]
    var listofdp:[Userc]
    var _id:String
    var firstname:String
    var lastname:String
    var email:String
    var password:String
    var phonenum:String
    
    

}
