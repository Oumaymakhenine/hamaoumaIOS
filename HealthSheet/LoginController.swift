//
//  LoginController.swift
//  HealthSheet
//
//  Created by macbook on 21/11/2020.
//

import Alamofire
import UIKit

class LoginController: UIViewController {

    let serverUrl = "http://192.168.1.55:3000/api/auth/signin"
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        var dta = sender as! String
        
        //let dest = segue.destination as! MenuController
    
    MenuController.dtaa = dta
    }

  
    
    
    @IBAction func loginAction(_ sender: Any) {
        

        let x = "x"
        let rol = Role(name: "Doctor")
        print("jkbcd")
        let roles = [rol]
     //  let  u = User(username: usrp.text!,email: x, password: usrp.text!,role: roles)
        var u = Userc( username: usrn.text!, password: usrp.text!)

      AF.request(serverUrl,
                    method: .post,
                    parameters: u,
                    encoder: JSONParameterEncoder.default).response { response in
 //                    response in
 //                    debugPrint(response)
                     switch response.result {
                             case .success:
                                 print("Validation Successful Hama")
                               var dataString = NSString(data: response.data!, encoding:String.Encoding.utf8.rawValue)
                             var   dd = dataString! as String
                                
                              // print(dd)
                               self.performSegue(withIdentifier: "first", sender: dd)
                            //    self.performSegue(withIdentifier: "welcome", sender: dd)

                                case let .failure(error):
                                print(error)
                             }
                    }}
    @IBOutlet weak var usrp: UITextField!
    @IBOutlet weak var usrn: UITextField!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
      /*  let queue = DispatchQueue(label: "WithdrawalQueue", attributes: .concurrent)
        queue.async {
        
        }*/

    }}
