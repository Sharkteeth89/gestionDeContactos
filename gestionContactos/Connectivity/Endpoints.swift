import Foundation

class Endpoints {
    
    private init() {}
    
    static let shared = Endpoints()
    
    let url = "https://superapi.netlify.app"
    
    //User´s Petitions
    enum User {
        static let getUsers:String = "/api/users"
        static let register:String = "/api/register"
        static let login:String = "/api/login"
        static let restorePassword:String = "/generateNewPassword"
        static let updatePassword:String = "/updatePassword"
    }
}
