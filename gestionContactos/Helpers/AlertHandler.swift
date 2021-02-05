//
//  AlertHandler.swift
//  gestionContactos
//
//  Created by alumnos on 05/02/2021.
//  Copyright © 2021 alumnos. All rights reserved.
//

import Foundation
import UIKit

class AlertHandler{
    
    
    static let shared = AlertHandler()
    
    func addActionAlert(alert: UIAlertController, nc: UINavigationController, goRoot: Bool){
        if alert.actions.count == 0 {
            if goRoot {
                alert.addAction(UIAlertAction(title: "OK", style: .cancel){
                    UIAlertAction in nc.popToRootViewController(animated: true)
                })
            }else{
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            }
        }
        nc.present(alert, animated: true, completion: nil)
    }
}

