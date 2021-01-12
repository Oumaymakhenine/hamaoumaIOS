//
//  AboutDoctorController.swift
//  HealthSheet
//
//  Created by macbook on 13/12/2020.
//

import UIKit

class AboutPatient: UIViewController {
    var us = User(username: "d", firstname: "d", lastname: "d", email: "d")
     var data = "ddd"
    @IBOutlet weak var PhonePat: UILabel!
    @IBOutlet weak var EmailPat: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var AgePatint: UILabel!
    @IBOutlet weak var LastNamePat: UILabel!
    @IBOutlet weak var FirstNamePa: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        FirstNamePa.text = us.firstname
        LastNamePat.text = us .lastname
        EmailPat.text = us.email
        
    }
    

}
