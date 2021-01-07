//
//  SendAnalyseViewController.swift
//  HealthSheet
//
//  Created by Hama on 1/7/21.
//

import UIKit

class SendAnalyseViewController: UIViewController {


    var a:Analyse?

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var to: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
       let url = "http://192.168.1.102:3000/api/image/"+a!.filename
        let today = Date()
       // let data = try? Data(contentsOf: url)
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        print(formatter1.string(from: today))
        
        
        from.text = a?.filename
        date.text = formatter1.string(from: today)
    }
    
}
