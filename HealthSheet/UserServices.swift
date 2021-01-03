//
//  UserServices.swift
//  HealthSheet
//
//  Created by Hama on 11/28/20.
//
import Alamofire
import Foundation



class UserServices {
    
   static let serverUrl = "http://192.168.5.172:3000/api/auth/getuser"

static func getUser(u:User) -> User {
   var us = User(username: "d", firstname: "d", lastname: "d", email: "d")
    AF.request(serverUrl,
                  method: .post,
                  parameters: u,
                  encoder: JSONParameterEncoder.default).response { response in
//                    response in
//                    debugPrint(response)
                   switch response.result {
                           case .success:
                               print("Validation Successful Hama")
                              var dataString = NSString(data: response.data!, encoding:String.Encoding.utf8.rawValue)
                           var   dd = dataString! as String
                            print(dd)
                           let jsonData = Data(dd.utf8)
                            let decoder = JSONDecoder()

                            do {
                                us  = try decoder.decode(User.self, from: jsonData)
                               
                                    //return us
                                } catch {
                                print(error)
                            }
//
                          
                              case let .failure(error):
                              print(error)
                           }
                  }
    //print("hhh"+us.email)
return us
    }
}
   /* Alamofire.request(.POST, serverUrl, parameters: loginRequest,encoding: .JSON).responseJSON
        {
            response in switch response.result {
            case .Success(let data): break
            
            case .Failure(let error):
                print("Request failed with error: \(error)")
        }*/
    
