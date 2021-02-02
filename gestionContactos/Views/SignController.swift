import UIKit

class SignController: UIViewController {

    
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var confirmPasswordTF: UITextField!
    
    @IBAction func createUser(_ sender: UIButton) {
        if !emailTF.text!.isEmpty && !passwordTF.text!.isEmpty{
            if passwordTF.text == confirmPasswordTF.text {
                
                var user = User.init(name: emailTF.text!, email: emailTF.text!, profilePic: emailTF.text!, username: emailTF.text!, surname: emailTF.text!, password: passwordTF.text!)
                
                Requests.shared.registerUser(user: user)
            }
        }
    }
    var email = ""
    var password = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    

    
}
