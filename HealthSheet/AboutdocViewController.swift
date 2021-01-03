//
//  testdocViewController.swift
//  HealthSheet
//
//  Created by macbook on 8/12/2020.
//

import UIKit

class AboutdocViewController: UIViewController {
    var us = User(username: "d", firstname: "d", lastname: "d", email: "d")
     var data = "ddd"
    
    
    @IBOutlet weak var RaringDoc: UIStackView!
    @IBOutlet weak var imageDoc: UIImageView!
    //var itemToEdit: (title: String, subtitle: String)?

   

    @IBOutlet weak var lasnamedoc: UILabel!
    
    @IBOutlet weak var firstname: UILabel!
   
    @IBOutlet weak var emaildoc: UILabel!
    @IBOutlet weak var RatingDoc: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
      //  let h = User(username: data , firstname: "d", lastname: "d", email: "d")
       // var hama = UserServices.getUser(u: h)
        print("doctor " + us.email)
        firstname.text = us.firstname
        lasnamedoc.text = us.lastname
        emaildoc.text = us.email
    /*    if let itemToEdit = itemToEdit {
            fifi.text = itemToEdit.title
            textfi.text = itemToEdit.subtitle
        
        }*/
        
        

}
}
