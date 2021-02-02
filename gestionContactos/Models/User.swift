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
    
     
     private var _name:String
    /*
     private var _username:String
     private var _email:String
     private var _surname:String
     private var _dateOfBirth:String
     private var _profilePic:String?
     private var _password:String
 */
    
    enum CodingKeys:String, CodingKey {
        case _name = "user"
        /*
         case _username = "username"
        case _profilePic = "profile_pic"
        case _email = "email"
        case _surname = "surname"
        case _password = "password"
        case _dateOfBirth = "dateOfBirth"
         */
    }
    
    init(name:String /*, email:String, password:String, dateOfBirth:String*/){
        
        self._name = name
        /*
        self._username = username
        self._email = email
        
        self._surname = "-"
        self._profilePic = "-"
        self._password = password
        self._dateOfBirth = dateOfBirth
         */
    }
}
