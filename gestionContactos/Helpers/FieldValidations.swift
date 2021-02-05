import Foundation

enum ValidatorType
{
    case email
    case password
}

enum ValidationError: Error, LocalizedError
{
    case invalidEmail
    case invalidPassword

    
    var localizedDescription: String
    {
        switch self
        {
            case .invalidEmail:
                return "Please enter a valid email"
            case .invalidPassword:
                return "Please enter a password"
        }
    }
}
