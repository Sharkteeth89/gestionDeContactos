import Foundation

class Parameters{
    
    private init() {}
    
    static let shared = Parameters()
    
    let username = "username"
    let email = "email"
    let password = "password"
    let api_token = "api_token"
    let new_password = "new_password"
}
