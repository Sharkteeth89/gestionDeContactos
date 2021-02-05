import Foundation
extension String
{
    func validatedText(_ validationType: ValidatorType) throws
    {
        switch validationType
        {
            case .email:
                try validateEmail()
            case .password:
                try validatePassword()
        }
    }

    private func validateEmail() throws
    {
        if isEmpty
        {
            throw ValidationError.invalidEmail
        }
    }
    
    private func validatePassword() throws
    {
        if isEmpty
        {
            throw ValidationError.invalidPassword
        }
    }
}
