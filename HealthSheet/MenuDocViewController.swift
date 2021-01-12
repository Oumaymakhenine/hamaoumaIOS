//
//  MenuDocViewController.swift
//  HealthSheet
//
//  Created by macbook on 30/12/2020.
//

import UIKit

class MenuDocViewController: UIViewController {

    @IBAction func logout(_ sender: Any) {
    }
    @IBAction func About(_ sender: Any) {
    }
    @IBAction func doctors(_ sender: Any) {
    }
    @IBAction func near(_ sender: Any) {
    }
    @IBAction func Notification(_ sender: Any) {
    }
    @IBAction func Account(_ sender: Any) {
    }
    static var hama = [""]
    static var people = Testuser(roles: "h", listofdp: ["d"], username: "x", firstname: "x", lastname: "x", email: "x", password: "x", analyses: ["f"])
    static var dtaa = ""

    @IBOutlet weak var m: UIView!
    var menuIsHidden = true
    @IBAction func oumayma(_ sender: UIBarButtonItem)
    {
        print("hhhaaannnaaa")
        if menuIsHidden {
            m.isHidden = false
            menuIsHidden = false
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        }else{
           m.isHidden = true

            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
        }
        menuIsHidden = !menuIsHidden
    }
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        m.isHidden = true
    }
    

}
