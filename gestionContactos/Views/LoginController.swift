import UIKit

class LoginController: UIViewController {

    var token = ""
    @IBOutlet weak var emailTV: UITextField!
    @IBOutlet weak var passwordTV: UITextField!
    @IBAction func login(_ sender: UIButton) {
        if !emailTV.text!.isEmpty && !passwordTV.text!.isEmpty{
            let parameters = [
                "username":emailTV.text!,
                "password":passwordTV.text!
            ]
            var request = Requests.shared.login(user: parameters)
            
            request.responseJSON { (response) in
                 print(response.value!)
            }
            //print(token)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        /*
        Requests.shared.getUsers().responseJSON{
            response in print(response.value!)
        }
 */
        //Requests.shared.registerUser(user: array)
        //Requests.shared.login(user: array)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
