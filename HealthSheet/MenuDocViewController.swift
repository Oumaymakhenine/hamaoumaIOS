//
//  MenuDocViewController.swift
//  HealthSheet
//
//  Created by macbook on 30/12/2020.
//

import UIKit
import Alamofire

class MenuDocViewController: UIViewController {
    let serverUrl = ApiUtis.Path + "/api/auth/get"
    
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
        fillanalyses()
        m.isHidden = true
    }
    
    
    func fillanalyses() {
        for u0 in MenuDocViewController.people.analyses{
        let queue = DispatchQueue(label: "WithdrawalQueue", attributes: .concurrent)
          queue.async {
            var ll = [Analyse]()
                let u = id(id: u0)
            AF.request(self.serverUrl,
                    method: .post,
                    parameters: u,
                    encoder: JSONParameterEncoder.default).response { response in
 //                    response in
 //                    debugPrint(response)
                     switch response.result {
                             case .success:
                            
                               var dataString = NSString(data: response.data!, encoding:String.Encoding.utf8.rawValue)
                             var   dd = dataString! as String
                                
                                let jsonData = Data(dd.utf8)
                                let decoder = JSONDecoder()

                                do {
                                    
                                    let u1 = try decoder.decode(Analyse.self, from: jsonData)
                                    ll.append(u1)
                                    ListAnalysisViewController.list = ll
                                    print(u1.doctor)
                                    } catch {
                                    print(error)
                                }
                        case let .failure(error):
                                print(error)
                             }
                    }}
        
        
        }
    }
    

}
