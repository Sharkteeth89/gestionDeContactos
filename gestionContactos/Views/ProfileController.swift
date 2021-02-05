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
    let alert = UIAlertController(title: "Account Deleted", message: "Thanks for using us!", preferredStyle: .alert)
    
    
    @IBOutlet var oldPassword: UITextField!
    @IBOutlet var newPassword: UITextField!
    
    @IBAction func deleteUser(_ sender: Any) {
        Requests.shared.deleteUser(api_token:["api_token": UserDefaults.standard.string(forKey: "api_token")!]).responseJSON { (response) in
            if response.value! as! String == "Deleted"{
                self.alert.addAction(UIAlertAction(title: "OK", style: .cancel){
                    UIAlertAction in self.navigationController?.popToRootViewController(animated: true)
                })
                self.present(self.alert, animated: true, completion: nil)
            }
        }
    }
    
    
    @IBAction func changePassword(_ sender: Any) {
        oldPassword.isHidden = false
        newPassword.isHidden = false
    }
    @IBOutlet weak var profileName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
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
