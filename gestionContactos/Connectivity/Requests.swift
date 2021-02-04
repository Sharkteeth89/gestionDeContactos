import Foundation
import Alamofire

class Requests{
    
    static let shared = Requests()
    
    private init() {
        
    }
    
    func getUsers() -> DataRequest {      
        
        return AF.request(Endpoints.shared.url_server+Endpoints.User.getUsers, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor:nil)
        
    }
    func registerUser(user:User) -> DataRequest {
        return AF.request(Endpoints.shared.url_server+Endpoints.User.register, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: nil, interceptor: nil)
    }	
    
    func restorePassword(parameters:[String:String])-> DataRequest {
        return AF.request(Endpoints.shared.url_server+Endpoints.User.restorePassword, method: .post, parameters:parameters , encoder: JSONParameterEncoder.default)
    }
    func login(user:[String:String])  -> DataRequest{
        return AF.request(Endpoints.shared.url_server+Endpoints.User.login, method: .post, parameters:user , encoder: JSONParameterEncoder.default)
    }
    
    func deleteUser(api_token:[String:String]) -> DataRequest {
        return AF.request(Endpoints.shared.url_server + Endpoints.User.delete, method: .post, parameters: api_token, encoder: JSONParameterEncoder.default, headers: nil, interceptor: nil)
    }
    
    func getProfileInfo(api_token:[String:String]) -> DataRequest {
        return AF.request(Endpoints.shared.url_server+Endpoints.User.getProfile, method: .post, parameters:api_token , encoder: JSONParameterEncoder.default)
    }
}
