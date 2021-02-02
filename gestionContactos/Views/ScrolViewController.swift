//
//  ScrolViewController.swift
//  gestionContactos
//
//  Created by user177260 on 2/1/21.
//  Copyright © 2021 alumnos. All rights reserved.
//

import UIKit
import Alamofire

class ScrolViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var users:NSArray = []
    
   
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getUsers()
    }
    func getUsers(){
       Requests.shared.getUsers().responseJSON{
        response in self.users = (response.value! as! NSArray)
        print(self.users)
        self.tableView.reloadData()
        }
    }
    
    // Devuelve el número de elemtos del listado
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }

    // Devuelve la celda de la posición correspondiente
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_ID") as! UserRow
        cell.nameLabel.text = users[indexPath.row] as? String
        //cell.profilePicIV.image = users[indexPath.row].profilePic
        return cell
    }

}
