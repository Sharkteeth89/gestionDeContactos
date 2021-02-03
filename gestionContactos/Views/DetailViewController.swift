//
//  DetailViewController.swift
//  gestionContactos
//
//  Created by alumnos on 03/02/2021.
//  Copyright © 2021 alumnos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailsNameTL: UILabel!
    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Requests.shared.deleteUser(api_token:["api_token": UserDefaults.standard.string(forKey: "api_token")!]).responseJSON { (response) in
            print(response.response?.description)
        }
        if(user != nil){
            detailsNameTL.text = user?._name
        }

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
