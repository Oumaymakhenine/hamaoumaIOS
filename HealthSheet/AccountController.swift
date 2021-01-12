//
//  AccountController.swift
//  HealthSheet
//
//  Created by macbook on 8/12/2020.
//
import Alamofire
import UIKit

class AccountController: UIViewController {

    let serverUrl = ApiUtis.Path + "/api/auth/updateuser"

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var ln: UITextField!
    @IBOutlet weak var fn: UITextField!
    @IBOutlet weak var username: UILabel!
    
    
    static var dtaa = "ddd"
    var people = MenuDocViewController.people
    

    
    @IBAction func upd(_ sender: Any) {
        
       
        
        people.email = email.text!
        people.firstname = fn.text!
        people.lastname = ln.text!
        
        AF.request(serverUrl,
                      method: .post,
                      parameters: people,
                      encoder: JSONParameterEncoder.default).response { response in
                       switch response.result {

                       
                       case .success:
                        
                        print("Validation Successful Hama")
                       var dataString = NSString(data: response.data!, encoding:String.Encoding.utf8.rawValue)
                        
                    var   dd = dataString! as String
                       
                            let data = response.data
                      print(dd)
                              

                                  //self.performSegue(withIdentifier: "accountP", sender: dd)
                                  case let .failure(error):
                                  print(error)
                               }
                      }
            
                    let alert = UIAlertController(title: "Update", message: "Successful.", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
    }

    @IBOutlet weak var update: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        email.text = people.email
        ln.text = people.lastname
        fn.text = people.firstname
        //username.text = people.username
        

    }
}
