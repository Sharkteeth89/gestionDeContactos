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
        
        
        if(user != nil){
            detailsNameTL.text = user?._name
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
