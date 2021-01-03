//
//  ListPViewController.swift
//  HealthSheet
//
//  Created by macbook on 13/12/2020.
//

import UIKit
import Alamofire
class ListPViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    let serverUrl = "http://172.16.123.25:3000/api/auth/getuser"
    let cellReuseIdentifier = "ReusableTableCell1"
    var hama:[String] = []
    
    var dtaa = "b"

    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonData = Data(dtaa.utf8)

        
        let decoder = JSONDecoder()

        do {
            let people = try decoder.decode(Testuser.self, from: jsonData)
            //print(people.listofdp[0].username)
            //print(people.listdp[0].username)
          //  print(people.description)
           // let hama = people.listofdp
            
        } catch {
            print(error.localizedDescription)
        }
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

   func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return hama.count
    }

 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        let row = indexPath.row
        
        cell.textLabel?.text = hama[row]
        cell.detailTextLabel?.text = hama[row]
        
        return cell
    }

   func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    // Override to support editing the table view.
 func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data
            hama.remove(at: indexPath.row)
            // Delete the row from the table itself
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var u = User(username: hama[indexPath.row], firstname: "d", lastname: "d", email: "d")
         AF.request(serverUrl,
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
                                 print(dd)
                                let jsonData = Data(dd.utf8)
                                 let decoder = JSONDecoder()

                                 do {
                                     u  = try decoder.decode(User.self, from: jsonData)
                                     print("ye rabii" + u.email)
                                    self.performSegue(withIdentifier: "cellAbout", sender: u)
                                         //return us
                                     } catch {
                                     print(error)
                                 }
     //
                               
                                   case let .failure(error):
                                   print(error)
                                }
                       }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let d = sender as! User
        let dd = segue.destination as! AboutPatient
      //  let d = hama[index]
        
        dd.us = d
    
     
    }
  

        
    }
    

    

