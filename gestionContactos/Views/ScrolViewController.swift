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
    
    var users:[User] = []
    
   
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        getUsers()
    }
    func getUsers(){
        
            let request = Requests.shared.getUsers()
        
            request.response{ (responseData) in
                
            guard let data = responseData.data else {return}
            
            do{
                
                self.users = try JSONDecoder().decode([User].self, from: data)
                self.tableView.reloadData()
                self.tableView.backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1)
            }catch{
                print("Error decoding == \(error)")
            }
        }
    }
    
    
    // Devuelve el número de elemtos del listado
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }

    // Devuelve la celda de la posición correspondiente
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_ID") as! UserRow
        cell.nameLabel.text = users[indexPath.row]._name
        //cell.profilePicIV.image = users[indexPath.row].profilePic
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selecteditem = users[indexPath.row]
        
        performSegue(withIdentifier: "details", sender: selecteditem)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        destination.user = sender as? User
    }

}
