//
//  LoginController.swift
//  HealthSheet
//
//  Created by macbook on 21/11/2020.
//

import Alamofire
import UIKit

class LoginController: UIViewController {

    let serverUrl = ApiUtis.Path + "/api/auth/signin"
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
      //  var dta = sender as! String
        
        //let dest = segue.destination as! MenuController
    
   // MenuController.dtaa = dta
    }

    @IBAction func loginAction(_ sender: Any) {
        let queue = DispatchQueue(label: "WithdrawalQueue", attributes: .concurrent)
          queue.async {

        let x = "x"
        let rol = Role(name: "Doctor")
        print("jkbcd")
        let roles = [rol]
     //  let  u = User(username: usrp.text!,email: x, password: usrp.text!,role: roles)
            var u = Userc( username: self.usrn.text!, password: self.usrp.text!)

            AF.request(self.serverUrl,
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
                                
                                let jsonData = Data(dd.utf8)
                                let decoder = JSONDecoder()

                                do {
                                    
                                    MenuDocViewController.people = try decoder.decode(Testuser.self, from: jsonData)
                                    if(MenuDocViewController.people.roles == "DOCTOR"){
                                        print(dd)

                                   self.performSegue(withIdentifier: "first", sender: dd)
                                    }else{
                                        print(dd)
                                        PatientMenuController.people = MenuDocViewController.people
                                        self.performSegue(withIdentifier: "menuPatient", sender: dd)

                                    }
                                    } catch {
                                    print(error)
                                }
                        case let .failure(error):
                                print(error)
                             }
                    }}}
    @IBOutlet weak var usrp: UITextField!
    @IBOutlet weak var usrn: UITextField!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
      /*  let queue = DispatchQueue(label: "WithdrawalQueue", attributes: .concurrent)
        queue.async {
        
        }*/

    }}
