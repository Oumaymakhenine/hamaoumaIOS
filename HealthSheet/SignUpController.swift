//
//  SignUpController.swift
//  HealthSheet
//
//  Created by macbook on 21/11/2020.
//
import Alamofire
import UIKit

class SignUpController: UIViewController {
    @IBOutlet var doc: UIView!
    @IBOutlet weak var doctor: UISwitch!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    
    let serverUrl = "http://192.168.43.111:3000/api/auth/signup"

    @IBAction func signup(_ sender: Any) {
        print("hama")
        if(password.text! == pssword2.text!){
        
        let rol = Role(name: "User")
        print("jkbcd")
        let roles = [rol]
        
      //  var u = User(username: username.text ?? "x", email: email.text ?? "x", password: password.text ?? "x", role:roles)
        var u = Userc(username: username.text! , visites: [], roles: roles, listdp: [], _id: "", firstname: firstname.text!, lastname: lastname.text!, email: email.text!, password: password.text!, phonenum: "")
        AF.request(serverUrl,
                    method: .post,
                    parameters: u,
                    encoder: JSONParameterEncoder.default).response { response in
 //                    response in
 //                    debugPrint(response)
                     switch response.result {
                             case .success:
                                 print("user added")
                                var dataString = NSString(data: response.data!, encoding:String.Encoding.utf8.rawValue)
                             var   dd = dataString! as String
 //                                let data = response.data
                              //   print(dd)
                              //  self.performSegue(withIdentifier: "welcome", sender: dd)
                             case let .failure(error):
                                 print(error)
                             }
        
                    }
        }
        
        else {
            print("confirm password")
        }
    }
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var pssword2: UITextField!
    
    
    var dtaa = "dataaaa"
   
    override func viewDidLoad() {
        super.viewDidLoad()
            
        
       // var u = User(username: username.text ?? "x", email: email.text ?? "x", password: password.text ?? "x")
        
      
        
       
        
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func password2 (_ sender: Any)
    {
        
    }
    @IBAction func hama(_ sender: Any) {
        
        print("hama")
        if(password.text! == pssword2.text!){
        
        let rol = Role(name: "User")
        print("jkbcd")
        let roles = [rol]
        
      //  var u = User(username: username.text ?? "x", email: email.text ?? "x", password: password.text ?? "x", role:roles)
        var u = Userc(username: username.text! , visites: [], roles: roles, listdp: [], _id: "", firstname: firstname.text!, lastname: lastname.text!, email: email.text!, password: password.text!, phonenum: "")
        AF.request(serverUrl,
                    method: .post,
                    parameters: u,
                    encoder: JSONParameterEncoder.default).response { response in
 //                    response in
 //                    debugPrint(response)
                     switch response.result {
                             case .success:
                                 print("user added")
                                var dataString = NSString(data: response.data!, encoding:String.Encoding.utf8.rawValue)
                             var   dd = dataString! as String
 //                                let data = response.data
                              //   print(dd)
                              //  self.performSegue(withIdentifier: "welcome", sender: dd)
                             case let .failure(error):
                                 print(error)
                             }
        
                    }
        }
        
        else {
            print("confirm password")
        }
        
        
    }
    @IBAction func s(_ sender: Any) {
        
        print("hama")
        if(password.text! == pssword2.text!){
        
        let rol = Role(name: "User")
        print("jkbcd")
        let roles = [rol]
        
      //  var u = User(username: username.text ?? "x", email: email.text ?? "x", password: password.text ?? "x", role:roles)
        var u = Userc(username: username.text! , visites: [], roles: roles, listdp: [], _id: "", firstname: firstname.text!, lastname: lastname.text!, email: email.text!, password: password.text!, phonenum: "")
        AF.request(serverUrl,
                    method: .post,
                    parameters: u,
                    encoder: JSONParameterEncoder.default).response { response in
 //                    response in
 //                    debugPrint(response)
                     switch response.result {
                             case .success:
                                 print("user added")
                                var dataString = NSString(data: response.data!, encoding:String.Encoding.utf8.rawValue)
                             var   dd = dataString! as String
 //                                let data = response.data
                              //   print(dd)
                              //  self.performSegue(withIdentifier: "welcome", sender: dd)
                             case let .failure(error):
                                 print(error)
                             }
        
                    }
        }
        
        else {
            print("confirm password")
        }
        
        
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
