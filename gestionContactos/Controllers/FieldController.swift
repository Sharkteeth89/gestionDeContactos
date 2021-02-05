import Foundation
import UIKit


public func checkEmail(textFieldEmail:UITextField) -> Bool
{
    do
    {
        try textFieldEmail.validatedText(.email)
    }
    catch let error
    {
        let validationError = error as! ValidationError
        return false
    }

    return true
}


public func checkPassword(textFieldPass:UITextField) -> Bool
{
    do
    {
        try textFieldPass.validatedText(.password)
    }
    catch let error
    {
        let validationError = error as! ValidationError
        return false
    }

    return true
}



