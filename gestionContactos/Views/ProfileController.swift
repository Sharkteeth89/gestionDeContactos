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

    @IBOutlet weak var profileName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
