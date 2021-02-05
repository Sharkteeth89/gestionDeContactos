import Foundation

class Errors{
    
    private init() {}
    
    static let shared = Errors()
    
    let userRequestError = "No user"
    let loginAlertError = "Login failed"
    let wrongEmail = "Wrong email"
    let tryAgain = "Try again!"
    let failed = "Failed"
    let mailExists = "Mail already exists"
    let failedRequest = "Failed to connect to the server"
    let wrongPassword = "Wrong current password introduced"
    
}
