//
//  ForgotPasswordController.swift
//  gestionContactos
//
//  Created by alumnos on 04/02/2021.
//  Copyright © 2021 alumnos. All rights reserved.
//

import UIKit

class ForgotPasswordController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    let wrongEmailAlert = UIAlertController(title: "Wrong email", message: "Try again", preferredStyle: .alert)
    let newPasswordAlert = UIAlertController(title: "This is your new password", message: "Your new password is: ", preferredStyle: .alert)
    
    @IBAction func recoverPassword(_ sender: Any) {
        if checkEmail(textFieldEmail: emailTF) {
            let parameters = [
                Parameters.shared.email : emailTF.text!
            ]
            let request = Requests.shared.restorePassword(parameters: parameters)
            
            request.responseJSON { (response) in
                if (response.value! as! String != "Wrong email"){
                    let pass = response.value! as! String
                    self.newPasswordAlert.message = "" + pass
                    AlertHandler.shared.addActionAlert(alert: self.newPasswordAlert, nc: self.navigationController!,goRoot: true)
                }else{
                    AlertHandler.shared.addActionAlert(alert: self.wrongEmailAlert, nc: self.navigationController!, goRoot: false)
                }                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
    }
}
