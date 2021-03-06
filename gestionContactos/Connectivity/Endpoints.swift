import Foundation

class Endpoints {
    
    private init() {}
    
    static let shared = Endpoints()
    
    let url_clase = "http://localhost:8888/Laravel/api-cryptonite/public/api/users"
    let url = "https://superapi.netlify.app"
    let url_server = "http://IP/api/users"
    
    //User´s Petitions
    enum User {
        
        static let register:String = "/register"
        static let login:String = "/login"
        static let restorePassword:String = "/restore/password"
        static let updatePassword:String = "/update/password"
        static let delete:String = "/remove"
        static let getProfile:String = "/profile/info"
        static let getUsers:String = "/all"
    }
}
