//
//  ListAnalysisViewController.swift
//  HealthSheet
//
//  Created by Hama on 1/12/21.
//

import UIKit

class ListAnalysisViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    static var list = [Analyse]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {

    return 1
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    return ListAnalysisViewController.list.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "analyse")
    let row = indexPath.row
    let cv = cell?.contentView
    let nom = cv?.viewWithTag(1) as! UILabel
    nom.text  = ListAnalysisViewController.list[row].doctor
  
    return cell!
}
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let hama = ListAnalysisViewController.list[indexPath.row]
        ShowAnalyseViewController.hh = hama
            self.performSegue(withIdentifier: "analyseshow", sender: indexPath.row)
    }
    }
