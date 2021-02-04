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
    
    @IBAction func recoverPassword(_ sender: Any) {
        if !emailTF.text!.isEmpty {
            let parameters = [
                "email" : emailTF.text!
            ]
            let request = Requests.shared.restorePassword(parameters: parameters)
            
            request.responseJSON { (response) in
                //TODO
            }
            
            
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
