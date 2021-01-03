import UIKit

class WelcomeViewController: UIViewController
{

    @IBOutlet weak var username: UITextField!
    var dtaa = "hama"
    
    @IBOutlet weak var email: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let jsonData = Data(dtaa.utf8)

        
        let decoder = JSONDecoder()

        do {
            let people = try decoder.decode(User.self, from: jsonData)
            print(people.email)
            email.text = people.email
            username.text = people.username
          //  print(people.description)
        } catch {
            print(error.localizedDescription)
        }
    }


}
