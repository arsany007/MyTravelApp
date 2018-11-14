//
//  ApiManager.swift
//  TalentsList
//
//  Created by Apple on 16/07/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import Foundation
import Alamofire

//typealias HTTPSucessBlock = (_ operation : URLSessionDataTask, _ responseObject : AnyObject) -> Void
//typealias HTTPFailureBlock = (_ operation : URLSessionDataTask, _ error : NSError) -> Void
typealias HTTPSucessBlock = (_ responseObject : AnyObject) -> Void
typealias HTTPFailureBlock = (_ error : NSError) -> Void


class APIManager: SessionManager {
    
    var successResult : HTTPSucessBlock?;
    var failtureResult : HTTPFailureBlock?;
    
    static let shared = APIManager()
    private let manager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 20
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    func sendPostRequest(_ dict : Parameters? ,_ apiName : String, headeras:[String:String] , andSuccessBlock succes : @escaping HTTPSucessBlock, andfailureBlock failure : @escaping HTTPFailureBlock){
        
        
        self.request("\(WS_BaseURL)\(apiName)", method: .post, parameters: dict, encoding: URLEncoding.default, headers: [:])
            .responseJSON { response in
                
//            print(response.request as Any)  // original URL request
//            print(response.response as Any) // URL response
            print(response.result.value as Any)   // result of response serialization
            
            if response.result.isSuccess{
                 succes(response.result.value as AnyObject)
            }else{
                failure(response.error! as NSError)
            }
        }
    }

    func sendGetRequest(_ apiName : String, headeras:[String:String] , andSuccessBlock succes : @escaping HTTPSucessBlock, andfailureBlock failure : @escaping HTTPFailureBlock){
        
        
        self.request(apiName, method: .get, parameters: [:], encoding: URLEncoding.default, headers: [:])
            .responseJSON { response in
                
                //            print(response.request as Any)  // original URL request
                //            print(response.response as Any) // URL response
                print(response.result.value as Any)   // result of response serialization
                
                if response.result.isSuccess{
                    succes(response.result.value as AnyObject)
                }else{
                    failure(response.error! as NSError)
                }
        }
    }

    func sendPostRequestWithHeader(_ dict : Parameters? ,_ apiName : String, andSuccessBlock succes : @escaping HTTPSucessBlock, andfailureBlock failure : @escaping HTTPFailureBlock){

        var request = URLRequest(url: URL(string: apiName)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("AUTH_HEADER_KEY", forHTTPHeaderField: "Authorization")
 
        //Convert Dictionary to JSON data
        let json = Helper.returnJsonString(param: dict! as NSDictionary)
        request.httpBody = json.data(using: String.Encoding.utf8.rawValue);
        
        self.request(request as URLRequestConvertible)
            .responseJSON { response in
                
                if response.result.isSuccess{
                    succes(response.result.value as AnyObject)
                }else{
                    failure(response.error! as NSError)
                }
        }
    }
    
    func uploadImage(_ dict:Parameters? , _ apiName : String, imageData : Data, andSuccessBlock succes : @escaping HTTPSucessBlock, andfailureBlock failure : @escaping HTTPFailureBlock){
        
        let headers: HTTPHeaders = [
//            "Content-type": "multipart/form-data",
            "Authorization":"Bearer \(getAccessToken())"
        ]
        
        self.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(imageData, withName: "attachment",fileName: "file.jpg", mimeType: "image/jpg")
            for (key, value) in dict! {
                multipartFormData.append((value as! String).data(using: String.Encoding.utf8)!, withName: key)
            }
            
        }, usingThreshold: UInt64.init(), to: "\(WS_BaseURL)\(apiName)", method: .post, headers: headers) { (result) in //to: "\(WS_BaseURL)\(apiName)") { (result) in
            
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })
                
                upload.responseString {response in
                    print(response.value ?? "")

                }
                upload.responseJSON { response in
                    print(response.result.value ?? "")
                    succes(response.result.value as AnyObject)
                }
                
            case .failure(let encodingError):
                print(encodingError)
                failure(encodingError as NSError)
            }

        }
        
    }
    
    func getAccessToken() -> String{
        let userData = userDefaultValueForKey(key: "USERDATA") as? NSDictionary
        if let dictData = userData?.value(forKey: "data") as? NSDictionary{
            
            let accessToken = dictData.value(forKey: "accessToken") as! String
            return accessToken
        }
        return ""
    }
}
