import UIKit

class SignController: UIViewController {

    
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var confirmPasswordTF: UITextField!
    let alert = UIAlertController(title: "User registered", message: "Log in now!", preferredStyle: .alert)
    let alertEmail = UIAlertController(title: "Algo salió mal", message: "Email no valido", preferredStyle: .alert)
    
    @IBAction func createUser(_ sender: UIButton) {
        if !emailTF.text!.isEmpty && !passwordTF.text!.isEmpty{
            if passwordTF.text == confirmPasswordTF.text {
                
                let user = User.init(name: emailTF.text!, email: emailTF.text!, profilePic: emailTF.text!, username: emailTF.text!, surname: emailTF.text!, password: passwordTF.text!)
                    
                let request = Requests.shared.registerUser(user: user)
                request.responseJSON { response in
                    if(response.response!.statusCode == 200){
                        self.alert.addAction(UIAlertAction(title: "OK", style: .cancel){
                            UIAlertAction in self.navigationController?.popToRootViewController(animated: true)
                        })
                        self.present(self.alert, animated: true, completion: nil)
                        
                    }
                }
            }
        }
    }
    var email = ""
    var password = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        
    }
    

    
}
