import Foundation

class Endpoints {
    
    private init() {}
    
    static let shared = Endpoints()
    
    let url_clase = "http://localhost:8888/Laravel/api-cryptonite/public/api/users"
    let url = "https://superapi.netlify.app"
    let url_server = "http://79.159.179.214/api/users"
    
    //User´s Petitions
    enum User {
        
        static let register:String = "/register"
        static let login:String = "/login"
        static let restorePassword:String = "/password/restore"
        static let updatePassword:String = "/updatePassword"
        static let delete:String = "/remove"
        static let getProfile:String = "/profile/info"
        static let getUsers:String = "/all"
    }
}
