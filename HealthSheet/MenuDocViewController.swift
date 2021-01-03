//
//  MenuDocViewController.swift
//  HealthSheet
//
//  Created by macbook on 30/12/2020.
//

import UIKit

class MenuDocViewController: UIViewController {
    var menuIshidden = false
   @IBOutlet weak var m: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        m.isHidden = false

        
    }
    
    @IBAction func mb(_ sender: UIBarButtonItem) {
        if menuIshidden {
           // leadConstraint.constant = 0
            m.isHidden = false

           // m.constant = 0
            menuIshidden = false
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        }else{
          //  leadConstraint.constant = -190
          //  m.constant = -190
            m.isHidden = true

            UIView.animate(withDuration: 0.1) {
                self.view.layoutIfNeeded()
        }
            menuIshidden = !menuIshidden
    }
    }
    
}
