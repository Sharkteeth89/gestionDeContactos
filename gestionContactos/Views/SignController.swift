import UIKit

class SignController: UIViewController {

    
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var confirmPasswordTF: UITextField!
    let alert = UIAlertController(title: "", message: "Log in now!", preferredStyle: .alert)
    
    @IBAction func createUser(_ sender: UIButton) {
        if checkEmail(textFieldEmail: emailTF) && checkPassword(textFieldPass: passwordTF) && checkPassword(textFieldPass: confirmPasswordTF){
            if passwordTF.text == confirmPasswordTF.text {
                
                let user = User.init(name: emailTF.text!, email: emailTF.text!, profilePic: emailTF.text!, username: emailTF.text!, surname: emailTF.text!, password: passwordTF.text!)
                    
                let request = Requests.shared.registerUser(user: user)
                request.responseJSON { response in
                    if(response.value! as! String == "User registered"){
                        self.alert.message = "User registered"
                        self.alert.addAction(UIAlertAction(title: "Go to login", style: .cancel){
                            UIAlertAction in self.navigationController?.popToRootViewController(animated: true)
                        })
                    }else{
                        self.alert.message = "Mail already exists"
                        self.alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                    }
                    self.present(self.alert, animated: true, completion: nil)
                }
            }
        }
    }    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        
    }
    

    
}
