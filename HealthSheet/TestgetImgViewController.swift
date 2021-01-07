//
//  TestgetImgViewController.swift
//  HealthSheet
//
//  Created by Hama on 12/7/20.
//
import Alamofire
import UIKit

class TestgetImgViewController: UIViewController {

    let url = "http://192.168.43.111:3000/api/image/1607333808489-HealthSheet-file.jpg"
    let urll = URL(fileURLWithPath: "http://192.168.43.111:3000/api/image/1607333808489-HealthSheet-file.jpg")
    @IBOutlet weak var img: UIImageView!

    private func fetchImage() {
               // spinner.startAnimating()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // img.load(url: urll)
      }
        
        // Do any additional setup after loading the view.
    //}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

