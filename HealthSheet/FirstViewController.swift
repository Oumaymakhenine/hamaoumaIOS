import UIKit

class FirstViewController: UIViewController {
  static var dtaa = "ggg"
    
    var people = Testuser(roles: ["h"], listofdp: ["d"], username: "x", firstname: "x", lastname: "x", email: "x", password: "x")
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dt = sender as! [String]
       // let des = segue.destination as! MenuController
        MenuController.hama = dt
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(FirstViewController.dtaa)
        
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


    @IBAction func list(_ sender: Any) {
        
        
        performSegue(withIdentifier: "l", sender: people.listofdp)

    }
}
