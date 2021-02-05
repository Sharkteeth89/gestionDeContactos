import UIKit

class LoginController: UIViewController {

    var api_token = ""
    @IBOutlet weak var emailTV: UITextField!
    @IBOutlet weak var passwordTV: UITextField!
    let alert = UIAlertController(title: Errors.shared.loginAlertError, message: Errors.shared.tryAgain, preferredStyle: .alert)
    
    
    @IBAction func login(_ sender: UIButton) {
        if checkEmail(textFieldEmail: emailTV) && checkPassword(textFieldPass: passwordTV){
            let parameters = [
                Parameters.shared.username : emailTV.text!,
                Parameters.shared.password : passwordTV.text!
            ]
            
            let request = Requests.shared.login(user: parameters)
            
            request.responseJSON { (response) in
                if (response.value! as! String) != Errors.shared.userRequestError{
                    let body = response.value as! String
                    let splitted = body.split(separator: " ")
                    let api_token = splitted[1]
                    
                    if(splitted[0] == RequestResponses.shared.ok){
                        UserDefaults.standard.set(api_token, forKey: Parameters.shared.api_token)
                        self.performSegue(withIdentifier: Identifiers.shared.main, sender: sender)
                    }else{
                        AlertHandler.shared.addActionAlert(alert: self.alert, nc: self.navigationController!, goRoot: false)
                    }
                }else{
                    AlertHandler.shared.addActionAlert(alert: self.alert, nc: self.navigationController!, goRoot: false)
                }                
            }            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
