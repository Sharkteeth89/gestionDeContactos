import UIKit

class SignController: UIViewController {

    
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var confirmPasswordTF: UITextField!
    let alertRegistered = UIAlertController(title: RequestResponses.shared.userRegistered, message: RequestResponses.shared.logInNow, preferredStyle: .alert)
    let alertFailed = UIAlertController(title: Errors.shared.failed, message: Errors.shared.mailExists, preferredStyle: .alert)
    
    @IBAction func createUser(_ sender: UIButton) {
        if checkEmail(textFieldEmail: emailTF) && checkPassword(textFieldPass: passwordTF) && checkPassword(textFieldPass: confirmPasswordTF){
            if passwordTF.text == confirmPasswordTF.text {
                
                let user = User.init(name: emailTF.text!, email: emailTF.text!, profilePic: emailTF.text!, username: emailTF.text!, surname: emailTF.text!, password: passwordTF.text!)
                    
                let request = Requests.shared.registerUser(user: user)
                request.responseJSON { response in
                    if(response.value! as! String == RequestResponses.shared.userRegistered){
                        AlertHandler.shared.addActionAlert(alert: self.alertRegistered, nc: self.navigationController!, goRoot: true)
                    }else{
                        AlertHandler.shared.addActionAlert(alert: self.alertFailed, nc: self.navigationController!, goRoot: false)
                    }
                }
            }
        }
    }    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        
    }
    

    
}
