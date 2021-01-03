//
//  AccountController.swift
//  HealthSheet
//
//  Created by macbook on 8/12/2020.
//
import Alamofire
import UIKit

class AccountController: UIViewController {

    let serverUrl = "http://192.168.1.55:3000/api/auth/updateuser"

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var ln: UITextField!
    @IBOutlet weak var fn: UITextField!
    @IBOutlet weak var username: UILabel!
    
    
    static var dtaa = "ggg"
    var people = MenuController.people

    

    
    @IBAction func upd(_ sender: Any) {
        
       /* var u = Userc( username: "x", password: "a")
         //= fn.text as! String
        // = ln.text as! String
        u.email = email.text as! String*/
        
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
                       
//                                let data = response.data
                      print(dd)
                              

                                  //self.performSegue(withIdentifier: "accountP", sender: dd)
                                  case let .failure(error):
                                  print(error)
                               }
          
                      }
    }

    @IBOutlet weak var update: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let jsonData = Data(FirstViewController.dtaa.utf8)
        let decoder = JSONDecoder()

        do {
             people = try decoder.decode(Testuser.self, from: jsonData)
           // print("haammmaa")
          //  print(people.username)
          //  print(people.listofdp[0])
         //   let h = User(username: people.listofdp[0], firstname: "d", lastname: "d", email: "d")
           // var hama = UserServices.getUser(u: h)
            
           // print("ye rabi  "+hama.email)
            //print(people.listdp[0].username)
          //  print(people.description)
            } catch {
            print(error)
        }
        
       
            
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
