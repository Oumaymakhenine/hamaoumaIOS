//
//  SendAnalyseViewController.swift
//  HealthSheet
//
//  Created by Hama on 1/7/21.
//

import UIKit
import Alamofire

class SendAnalyseViewController: UIViewController {

    static var i:UIImage?

   static var a:Analyse?

    let serverUrl = ApiUtis.Path + "/api/auth/send"
    @IBOutlet weak var send: UIBarButtonItem!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var to: UILabel!
    
    @IBAction func accept(_ sender: Any) {
        
        AF.request(serverUrl,
                    method: .post,
                    parameters: SendAnalyseViewController.a!,
                    encoder: JSONParameterEncoder.default).response { response in
 //                    response in
 //                    debugPrint(response)
                     switch response.result {
                             case .success:
                                 print("sended")
                    
                             case let .failure(error):
                                 print(error)
                             }
        
                    }
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let today = Date()
       // let data = try? Data(contentsOf: url)
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        print(formatter1.string(from: today))
        img.image = SendAnalyseViewController.i!
        
        from.text = SendAnalyseViewController.a?.filename
        date.text = formatter1.string(from: today)
    }
    
}

