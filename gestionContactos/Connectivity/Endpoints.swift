import Foundation

class Endpoints {
    
    private init() {}
    
    static let shared = Endpoints()
    
    let url_clase = "http://localhost:8888/Laravel/api-cryptonite/public/api/users"
    let url = "https://superapi.netlify.app"
    
    //User´s Petitions
    enum User {
        static let getUsersMac:String = "/all"
        static let getUsers:String = "/api/users"
        static let register:String = "/register"
        static let login:String = "/login"
        static let restorePassword:String = "/generateNewPassword"
        static let updatePassword:String = "/updatePassword"
    }
}
