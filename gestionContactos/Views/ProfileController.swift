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
    let alertDelete = UIAlertController(title: "Account Deleted", message: "Thanks for using us!", preferredStyle: .alert)
    let alertPasswordChaged = UIAlertController(title: "Password changed!", message: "Have a nice day!", preferredStyle: .alert)
    let alertPasswordFailed = UIAlertController(title: "Wrong current password introduced", message: "Try again!", preferredStyle: .alert)
    
    
    
    @IBOutlet var oldPassword: UITextField!
    @IBOutlet var newPassword: UITextField!
    
    @IBAction func deleteUser(_ sender: Any) {
        Requests.shared.deleteUser(api_token:["api_token": UserDefaults.standard.string(forKey: "api_token")!]).responseJSON { (response) in
            if response.value! as! String == "Deleted"{
                self.alertDelete.addAction(UIAlertAction(title: "OK", style: .cancel){
                    UIAlertAction in self.navigationController?.popToRootViewController(animated: true)
                })
                self.present(self.alertDelete, animated: true, completion: nil)
            }
        }
    }
    
    
    @IBAction func changePassword(_ sender: Any) {
        oldPassword.isHidden = false
        newPassword.isHidden = false
        
        if checkPassword(textFieldPass: oldPassword) && checkPassword(textFieldPass: newPassword) {
            let parameters = [
                "api_token" : UserDefaults.standard.string(forKey: "api_token")!,
                "password" : oldPassword.text!,
                "new_password" : newPassword.text!
            ]
            let request = Requests.shared.updatePassword(parameters: parameters)
            request.responseJSON { (response) in
                if(response.value! as! String == "OK"){
                    self.alertPasswordChaged.addAction(UIAlertAction(title: "OK", style: .cancel){
                        UIAlertAction in
                            self.oldPassword.text! = ""
                            self.newPassword.text! = ""
                            self.oldPassword.isHidden = true
                            self.newPassword.isHidden = true
                    })
                    self.present(self.alertPasswordChaged, animated: true, completion: nil)
                }else{
                    self.alertPasswordFailed.addAction(UIAlertAction(title: "OK", style: .cancel))
                    self.present(self.alertPasswordFailed, animated: true, completion: nil)
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
    
        let request = Requests.shared.getProfileInfo(api_token: ["api_token": UserDefaults.standard.string(forKey: "api_token")!])
        
            request.response{ (responseData) in
                
                guard let data = responseData.data else {return}
            
                do{                
                    self.user = try JSONDecoder().decode(User.self, from: data)
                    self.profileName.text = self.user?._username
                }catch{
                    print("Error decoding == \(error)")
                }
            }
    }
}
