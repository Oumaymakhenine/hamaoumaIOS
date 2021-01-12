//
//  PatientMenuController.swift
//  HealthSheet
//
//  Created by Hama on 1/11/21.
//

import UIKit

class PatientMenuController: UIViewController {
    static var people = Testuser(roles: "h", listofdp: ["d"], username: "x", firstname: "x", lastname: "x", email: "x", password: "x", analyses: ["f"])
    
    @IBOutlet weak var menuuuuuu: UIView!
    @IBAction func btnmenu(_ sender: UIBarButtonItem) {
    }
    @IBOutlet weak var vim: UIView!
    var menuIsHidden = true
    @IBAction func mina(_ sender: UIBarButtonItem) {
        if menuIsHidden {
            vim.isHidden = false
            menuIsHidden = false
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        }else{
            vim.isHidden = true

            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
        }
        menuIsHidden = !menuIsHidden
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        vim.isHidden = true


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
