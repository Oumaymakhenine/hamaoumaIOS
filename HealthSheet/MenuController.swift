//
//  MenuController.swift
//  HealthSheet
//
//  Created by macbook on 21/11/2020.
//
import SideMenu
import UIKit

class MenuController: UIViewController {
    static var hama = [""]
    static var people = Testuser(roles: ["h"], listofdp: ["d"], username: "x", firstname: "x", lastname: "x", email: "x", password: "x")
    static var dtaa = ""
    @IBOutlet weak var m: NSLayoutConstraint!
    @IBOutlet weak var menuView: UIView!
    var menuIsHidden = true
    @IBOutlet weak var leadConstraint: NSLayoutConstraint!
    @IBAction func oumayma(_ sender: UIBarButtonItem) {
        if menuIsHidden {
            //leadConstraint.constant = 0
            menuView.isHidden = false

           // m.constant = 0
            menuIsHidden = false
            UIView.animate(withDuration: 0.1) {
                self.view.layoutIfNeeded()
            }
        }else{
           // leadConstraint.constant = -190
           // m.constant = -190
            menuView.isHidden = true

            UIView.animate(withDuration: 0.1) {
                self.view.layoutIfNeeded()
        }
        menuIsHidden = !menuIsHidden
    }
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.isHidden = true
//        leadConstraint.constant = -190
        //m.constant = -190


    }
    

       /*var menu: SideMenuNavigationController?
        override func viewDidLoad() {
            super.viewDidLoad()
            
        menu = SideMenuNavigationController(rootViewController: MenuListController())
            
            menu?.leftSide = true
            SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView:self.view)
        }
        
        @IBAction func didTapMenu() {
            
          present(menu! ,animated: true)
            
        }
        
    }
class MenuListController: UITableViewController{
     var items = ["Account","About","Notifications","Doctors Near to me","Doctors","Log-Out"]
    let blueColor = UIColor(red: 33/255.0,
                            green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = blueColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"cell")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = blueColor
        return cell
    }
}*/


}
