import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(Requests.shared.getUsers())
        var username = "Jose2"
        let array = ["user": username,"pass":"123"]
        
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
