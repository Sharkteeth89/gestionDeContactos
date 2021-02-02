//
//  User.swift
//  gestionContactos
//
//  Created by user177260 on 2/1/21.
//  Copyright © 2021 alumnos. All rights reserved.
//

import Foundation
import UIKit

class User : Encodable, Decodable{
    
     
      var _name:String
      var _email:String
      var _surname:String
      var _profilePic:String
      var _username:String
    var _password:String?
    
    enum CodingKeys:String, CodingKey {
        case _name = "name"
        case _username = "username"
        case _email = "email"
        case _surname = "surname"
        case _profilePic = "profile_pic"
        case _password = "password"
        }
    
    init(name:String, email:String, profilePic:String, username:String, surname:String, password:String){
        
        self._name = name
        self._username = username
        self._email = email
        self._surname = surname
        self._profilePic = profilePic
        self._password = password
    }
}
