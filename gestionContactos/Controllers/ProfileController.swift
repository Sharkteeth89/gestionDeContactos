//
//  ProfileController.swift
//  gestionContactos
//
//  Created by alumnos on 04/02/2021.
//  Copyright © 2021 alumnos. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    
    var user : User?
    let alertDelete = UIAlertController(title: RequestResponses.shared.accountDeleted, message: RequestResponses.shared.thanks, preferredStyle: .alert)
    let alertPasswordChaged = UIAlertController(title: RequestResponses.shared.passwordChanged, message: RequestResponses.shared.haveANiceDay, preferredStyle: .alert)
    let alertPasswordFailed = UIAlertController(title: Errors.shared.wrongPassword, message: Errors.shared.tryAgain, preferredStyle: .alert)
    
    
    
    @IBOutlet var oldPassword: UITextField!
    @IBOutlet var newPassword: UITextField!
    
    @IBAction func deleteUser(_ sender: Any) {
        Requests.shared.deleteUser(api_token:[Parameters.shared.api_token: UserDefaults.standard.string(forKey: Parameters.shared.api_token)!]).responseJSON { (response) in
            if response.value! as! String == RequestResponses.shared.deleted{
                AlertHandler.shared.addActionAlert(alert: self.alertDelete, nc: self.navigationController!, goRoot: true)
            }
        }
    }
    
    
    @IBAction func changePassword(_ sender: Any) {
        oldPassword.isHidden = false
        newPassword.isHidden = false
        
        if checkPassword(textFieldPass: oldPassword) && checkPassword(textFieldPass: newPassword) {
            let parameters = [
                Parameters.shared.api_token : UserDefaults.standard.string(forKey: Parameters.shared.api_token)!,
                Parameters.shared.password : oldPassword.text!,
                Parameters.shared.new_password : newPassword.text!
            ]
            let request = Requests.shared.updatePassword(parameters: parameters)
            request.responseJSON { (response) in
                if(response.value! as! String == RequestResponses.shared.ok){
                    AlertHandler.shared.addActionAlert(alert: self.alertPasswordChaged, nc: self.navigationController!, goRoot: false)
                    self.oldPassword.text! = ""
                    self.newPassword.text! = ""
                    self.oldPassword.isHidden = true
                    self.newPassword.isHidden = true
                }else{
                    AlertHandler.shared.addActionAlert(alert: self.alertPasswordFailed, nc: self.navigationController!, goRoot: false)
                }
            }
        }
    }
    @IBOutlet weak var profileName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        oldPassword.isHidden = true
        newPassword.isHidden = true
    
        let request = Requests.shared.getProfileInfo(api_token: [Parameters.shared.api_token: UserDefaults.standard.string(forKey: Parameters.shared.api_token)!])
        
            request.response{ (responseData) in
                
                guard let data = responseData.data else {return}
            
                do{                
                    self.user = try JSONDecoder().decode(User.self, from: data)
                    self.profileName.text = self.user?._username
                }catch{
                    print(Errors.shared.failedRequest)
                }
            }
    }
}
