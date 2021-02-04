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
    let alert = UIAlertController(title: "Nope dude", message: "Your new password is: ", preferredStyle: .alert)
    
    @IBAction func recoverPassword(_ sender: Any) {
        if !emailTF.text!.isEmpty {
            let parameters = [
                "email" : emailTF.text!
            ]
            let request = Requests.shared.restorePassword(parameters: parameters)
            
            request.responseJSON { (response) in
                if (response.value! as! String != "Wrong email"){
                    let pass = response.value! as! String
                    self.alert.message = "Your new password is: " + pass
                    self.alert.addAction(UIAlertAction(title: "OK", style: .cancel){
                        UIAlertAction in self.navigationController?.popToRootViewController(animated: true)
                    })                    
                }else{
                    self.alert.message = "Wrong email"
                }
                self.present(self.alert, animated: true, completion: nil)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alert.addAction(UIAlertAction(title: "OK", style: .cancel))
    }
}
