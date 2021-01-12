//
//  ShowAnalyseViewController.swift
//  HealthSheet
//
//  Created by Hama on 1/12/21.
//

import UIKit


class ShowAnalyseViewController: UIViewController {
static var hh = Analyse(filename: "", doctor: "", patient: "")
    @IBOutlet weak var imgan: UIImageView!
    @IBOutlet weak var imganalyse: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       let u = ApiUtis.Image + ShowAnalyseViewController.hh.filename
      // let u = "http://192.168.1.102:3000/api/image/1610111086511-HealthSheet-file.jpg"
        DispatchQueue.global().async { [weak self] in
            let url = URL(string: u)
            if let data = try? Data(contentsOf: url!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.imgan.image = image
                    }
                }
            }
        }

    }

}

extension UIImageView {
    func load(url:URL ) {
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
