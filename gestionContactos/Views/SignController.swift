import UIKit

class SignController: UIViewController {

    
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var confirmPasswordTF: UITextField!
    let alert = UIAlertController(title: "", message: "Log in now!", preferredStyle: .alert)
    
    @IBAction func createUser(_ sender: UIButton) {
        if !emailTF.text!.isEmpty && !passwordTF.text!.isEmpty{
            if passwordTF.text == confirmPasswordTF.text {
                
                let user = User.init(name: emailTF.text!, email: emailTF.text!, profilePic: emailTF.text!, username: emailTF.text!, surname: emailTF.text!, password: passwordTF.text!)
                    
                let request = Requests.shared.registerUser(user: user)
                request.responseJSON { response in
                    if(response.value! as! String == "User registered"){
                        self.alert.message = "User registered"
                        self.alert.addAction(UIAlertAction(title: "OK", style: .cancel){
                            UIAlertAction in self.navigationController?.popToRootViewController(animated: true)
                        })
                    }else{
                        self.alert.message = "Mail already exists"                        
                    }
                    self.present(self.alert, animated: true, completion: nil)
                }
            }
        }
    }    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        
    }
    

    
}
