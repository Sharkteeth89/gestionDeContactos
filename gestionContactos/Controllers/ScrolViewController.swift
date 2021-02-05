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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
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
                    print(Errors.shared.failedRequest)
                }
            }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.shared.cell) as! UserRow
        cell.nameLabel.text = users[indexPath.row]._name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selecteditem = users[indexPath.row]        
        performSegue(withIdentifier: Identifiers.shared.details, sender: selecteditem)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        destination.user = sender as? User
    }

}
