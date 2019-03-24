//
//  Request.swift
//  Weather_Restaurant_Demo
//
//  Created by Waqas Khan on 24/03/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Servicelayer: NSObject {
    
    struct STATUS_CODE  {
        static let UNAUTHENTICATED = 401
        static let FORBIDDEN = 403
        static let VALIDATION_ERROR = 200
        static let NOT_FOUND = 404
    }
    
    static let isShowError = false
    
    /**
     ** POST Method for calling API
     *  Services gateway
     *  Method  get response from server
     *  @parameter              -> requestObject: request josn object ,apiName: api endpoint
     *  @returm                 -> void
     *  @compilationHandler     -> success: status of api, response: respose from server, error: error handling
     **/
    
    static func requestWithPOST( parameters:[String:Any], apiName : String,
                                 completionHandler:
        @escaping (_ success : Bool, _ response : JSON, _ error : AnyObject?) -> Void) {
        print(apiName);
        
        //Mark check internet Connectivity
        if !ConnectionHelper.sharedInstance.isConnectedToNetwork(){
            Alert.sharedInstance.hideLoader()
            Alert.sharedInstance.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to internet");
            return;
        }
        Alert.sharedInstance.showLoader(message: "")
        
        Alamofire.request(apiName, method:HTTPMethod.post, parameters: parameters , encoding:  JSONEncoding.default, headers: APIManager.headers()).validate().responseJSON { (response:DataResponse<Any>) in
            
            Alert.hideLoader();
            
            switch(response.result) {
            case .success(let data):
                
                print(response)
                /* if response.result.value != nil{
                 print(data as! NSDictionary)
                 completionHandler(true, data as! JSON ,nil)
                 }
                 break*/
                if let value: Any = response.result.value as AnyObject? {
                    let response = JSON(value)
                    let dic = response.dictionaryObject
                    print("--------Response In JSON Format-----")
                    print(dic?.prettyPrintedJSON ?? "")
                    completionHandler(true, response   ,nil)
                    // let response = JSON(value)
                }
                
                
            case .failure(_):
                print("Request failed with error: \(response.result.error!)")
                //403,200
                
                print((response.result.error! as NSError).localizedDescription)
                
                if response.response?.statusCode == STATUS_CODE.VALIDATION_ERROR{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.FORBIDDEN{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.NOT_FOUND{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "NOT FOUND", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.UNAUTHENTICATED{
                    ServerErrorHandling.updateAccessToken()
                    Alert.hideLoader()
                    
                    return
                }
                Alert.hideLoader()
                
                if isShowError {
                    self.showAlertView(message: (response.result.error!).localizedDescription as NSString, title: "Error From Server")
                }
                
                break
                
            }
        }
    }
    
    static func requestWithPOSTWithoutLoader( parameters:[String:Any], apiName : String,
                                              completionHandler:
        @escaping (_ success : Bool, _ response : JSON, _ error : AnyObject?) -> Void) {
        print(apiName);
        
        //Mark check internet Connectivity
        if !ConnectionHelper.sharedInstance.isConnectedToNetwork(){
            Alert.hideLoader()
            Alert.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to internet");
            return;
        }
        
        
        Alamofire.request(apiName, method:HTTPMethod.post, parameters: parameters , encoding:  JSONEncoding.default, headers: APIManager.headers()).validate().responseJSON { (response:DataResponse<Any>) in
            
            
            switch(response.result) {
            case .success(let data):
                
                print(response)
                /* if response.result.value != nil{
                 print(data as! NSDictionary)
                 completionHandler(true, data as! JSON ,nil)
                 }
                 break*/
                if let value: Any = response.result.value as AnyObject? {
                    let response = JSON(value)
                    let dic = response.dictionaryObject
                    print("--------Response In JSON Format-----")
                    print(dic?.prettyPrintedJSON ?? "")
                    completionHandler(true, response   ,nil)
                    // let response = JSON(value)
                }
                
                
            case .failure(_):
                print("Request failed with error: \(response.result.error!)")
                //403,200
                
                print((response.result.error! as NSError).localizedDescription)
                
                if response.response?.statusCode == STATUS_CODE.VALIDATION_ERROR{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.FORBIDDEN{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.NOT_FOUND{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "NOT FOUND", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.UNAUTHENTICATED{
                    ServerErrorHandling.updateAccessToken()
                    Alert.hideLoader()
                    
                    return
                }
                Alert.hideLoader()
                
                if isShowError {
                    self.showAlertView(message: (response.result.error!).localizedDescription as NSString, title: "Error From Server")
                }
                
                break
                
            }
        }
    }
    
    
    static func requestWithPOSTWithoutLoaderAndParam(apiName : String,
                                                     completionHandler:
        @escaping (_ success : Bool, _ response : JSON, _ error : AnyObject?) -> Void) {
        print(apiName);
        
        //Mark check internet Connectivity
        if !ConnectionHelper.sharedInstance.isConnectedToNetwork(){
            Alert.hideLoader()
            Alert.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to internet");
            return;
        }
        
        
        Alamofire.request(apiName, method:HTTPMethod.post, parameters: nil , encoding:  JSONEncoding.default, headers: APIManager.headers()).validate().responseJSON { (response:DataResponse<Any>) in
            
            
            switch(response.result) {
            case .success(let data):
                
                print(response)
                /* if response.result.value != nil{
                 print(data as! NSDictionary)
                 completionHandler(true, data as! JSON ,nil)
                 }
                 break*/
                if let value: Any = response.result.value as AnyObject? {
                    let response = JSON(value)
                    let dic = response.dictionaryObject
                    print("--------Response In JSON Format-----")
                    print(dic?.prettyPrintedJSON ?? "")
                    completionHandler(true, response   ,nil)
                    // let response = JSON(value)
                }
                
                
            case .failure(_):
                print("Request failed with error: \(response.result.error!)")
                //403,200
                
                print((response.result.error! as NSError).localizedDescription)
                
                if response.response?.statusCode == STATUS_CODE.VALIDATION_ERROR{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.FORBIDDEN{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.NOT_FOUND{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "NOT FOUND", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.UNAUTHENTICATED{
                    //ServerErrorHandling.updateAccessToken()
                    Alert.hideLoader()
                    
                    return
                }
                Alert.hideLoader()
                
                if isShowError {
                    self.showAlertView(message: (response.result.error!).localizedDescription as NSString, title: "Error From Server")
                }
                
                break
                
            }
        }
    }
    
    static func requestWithPOSTWithOldLoader( parameters:[String:Any], apiName : String,
                                              completionHandler:
        @escaping (_ success : Bool, _ response : JSON, _ error : AnyObject?) -> Void) {
        print(apiName);
        
        //Mark check internet Connectivity
        if !ConnectionHelper.sharedInstance.isConnectedToNetwork(){
            Alert.hideOldLoader()
            Alert.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to internet");
            return;
        }
        Alert.showOldLoader(message: "")
        
        Alamofire.request(apiName, method:HTTPMethod.post, parameters: parameters , encoding:  JSONEncoding.default, headers: APIManager.headers()).validate().responseJSON { (response:DataResponse<Any>) in
            
            Alert.hideOldLoader();
            
            switch(response.result) {
            case .success(let data):
                
                print(response)
                /* if response.result.value != nil{
                 print(data as! NSDictionary)
                 completionHandler(true, data as! JSON ,nil)
                 }
                 break*/
                if let value: Any = response.result.value as AnyObject? {
                    let response = JSON(value)
                    let dic = response.dictionaryObject
                    print("--------Response In JSON Format-----")
                    print(dic?.prettyPrintedJSON ?? "")
                    completionHandler(true, response   ,nil)
                    // let response = JSON(value)
                }
                
                
            case .failure(_):
                print("Request failed with error: \(response.result.error!)")
                //403,200
                
                print((response.result.error! as NSError).localizedDescription)
                
                if response.response?.statusCode == STATUS_CODE.VALIDATION_ERROR{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.FORBIDDEN{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.NOT_FOUND{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "NOT FOUND", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.UNAUTHENTICATED{
                    ServerErrorHandling.updateAccessToken()
                    Alert.hideOldLoader()
                    
                    return
                }
                Alert.hideOldLoader()
                
                if isShowError {
                    self.showAlertView(message: (response.result.error!).localizedDescription as NSString, title: "Error From Server")
                }
                
                break
                
            }
        }
    }
    
    
    static func requestWithPUT( parameters:[String:Any], apiName : String,
                                completionHandler:
        @escaping (_ success : Bool, _ response : JSON, _ error : AnyObject?) -> Void) {
        print(apiName);
        
        //Mark check internet Connectivity
        if !ConnectionHelper.sharedInstance.isConnectedToNetwork(){
            Alert.hideLoader()
            Alert.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to internet");
            return;
        }
        Alert.showLoader(message: "")
        
        Alamofire.request(apiName, method:HTTPMethod.put, parameters: parameters , headers: APIManager.headers()).validate().responseJSON { (response:DataResponse<Any>) in
            
            Alert.hideLoader();
            
            switch(response.result) {
            case .success(let data):
                
                print(response)
                /* if response.result.value != nil{
                 print(data as! NSDictionary)
                 completionHandler(true, data as! JSON ,nil)
                 }
                 break*/
                if let value: Any = response.result.value as AnyObject? {
                    let response = JSON(value)
                    let dic = response.dictionaryObject
                    print("--------Response In JSON Format-----")
                    print(dic?.prettyPrintedJSON ?? "")
                    completionHandler(true, response   ,nil)
                    // let response = JSON(value)
                }
                
                
            case .failure(_):
                print("Request failed with error: \(response.result.error!)")
                //403,200
                
                print((response.result.error! as NSError).localizedDescription)
                
                if response.response?.statusCode == STATUS_CODE.VALIDATION_ERROR{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.FORBIDDEN{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.NOT_FOUND{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "NOT FOUND", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.UNAUTHENTICATED{
                    ServerErrorHandling.updateAccessToken()
                    Alert.hideLoader()
                    
                    return
                }
                Alert.hideLoader()
                
                if isShowError {
                    self.showAlertView(message: (response.result.error!).localizedDescription as NSString, title: "Error From Server")
                }
                
                break
                
            }
        }
    }
    
    static func requestWithDELETE(header:[String:String], apiName : String,
                                  completionHandler:
        @escaping (_ success : Bool, _ response : JSON, _ error : AnyObject?) -> Void) {
        print(apiName);
        
        //Mark check internet Connectivity
        if !ConnectionHelper.sharedInstance.isConnectedToNetwork(){
            Alert.hideLoader()
            Alert.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to internet");
            return;
        }
        
        Alert.showLoader(message: "")
        
        Alamofire.request(apiName, method: .delete, parameters: nil, encoding: URLEncoding.default, headers: header).responseJSON { (response:DataResponse<Any>) in
            
            Alert.hideLoader();
            switch(response.result) {
            case .success(let data):
                
                
                print(response)
                /* if response.result.value != nil{
                 print(data as! NSDictionary)
                 completionHandler(true, data as! JSON ,nil)
                 }
                 break*/
                if let value: Any = response.result.value as AnyObject? {
                    let response = JSON(value)
                    
                    completionHandler(true, response   ,nil)
                    // let response = JSON(value)
                }
                
                
                
            case .failure(_):
                print("Request failed with error: \(response.result.error!)")
                //403,200
                
                print((response.result.error! as NSError).localizedDescription)
                
                if response.response?.statusCode == STATUS_CODE.VALIDATION_ERROR{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.FORBIDDEN{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.NOT_FOUND{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "NOT FOUND", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.UNAUTHENTICATED{
                    ServerErrorHandling.updateAccessToken()
                    Alert.hideLoader()
                    
                    return
                }
                Alert.hideLoader()
                
                if isShowError {
                    self.showAlertView(message: (response.result.error!).localizedDescription as NSString, title: "Error From Server")
                }
                
                break
                
            }
            
        }
        
    }
    
    
    static func requestWithParamDELETE(parameters:[String:Any], apiName : String,
                                       completionHandler:
        @escaping (_ success : Bool, _ response : JSON, _ error : AnyObject?) -> Void) {
        print(apiName);
        
        //Mark check internet Connectivity
        if !ConnectionHelper.sharedInstance.isConnectedToNetwork(){
            Alert.hideLoader()
            Alert.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to internet");
            return;
        }
        
        Alert.showLoader(message: "")
        
        
        Alamofire.request(apiName, method: .delete, parameters: nil, encoding: URLEncoding.default,headers:APIManager.headers()).validate().responseJSON { (response:DataResponse<Any>) in
            
            Alert.hideLoader();
            switch(response.result) {
            case .success(let data):
                
                
                print(response)
                /* if response.result.value != nil{
                 print(data as! NSDictionary)
                 completionHandler(true, data as! JSON ,nil)
                 }
                 break*/
                if let value: Any = response.result.value as AnyObject? {
                    let response = JSON(value)
                    
                    completionHandler(true, response   ,nil)
                    // let response = JSON(value)
                }
                
                
                
            case .failure(_):
                print("Request failed with error: \(response.result.error!)")
                //403,200
                
                print((response.result.error! as NSError).localizedDescription)
                
                if response.response?.statusCode == STATUS_CODE.VALIDATION_ERROR{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.FORBIDDEN{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.NOT_FOUND{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "NOT FOUND", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.UNAUTHENTICATED{
                    ServerErrorHandling.updateAccessToken()
                    Alert.hideLoader()
                    
                    return
                }
                Alert.hideLoader()
                
                if isShowError {
                    self.showAlertView(message: (response.result.error!).localizedDescription as NSString, title: "Error From Server")
                }
                
                break
                
            }
            
        }
    }
    
    static func DeleteRequest(fromSavedUrl url: String, parameters: [String: Any], callback: ((JSON?, Error?) -> Void)?) {
        
        print("API - Request URL: \(url)")
        
        Alamofire.request(url, method: .delete, parameters: parameters, headers: [:]).responseJSON{ (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if response.result.isSuccess {
                    if let value: Any = response.result.value as AnyObject? {
                        let response = JSON(value)
                        callback?(response, nil)
                    }
                }
                else {
                    print("Request failed with error: \(response.result.error!.localizedDescription)")
                    callback?(nil, response.result.error!)
                }
            case .failure(_):
                print("Request failed with error: \(response.result.error!)")
                //403,200
                
                print((response.result.error! as NSError).localizedDescription)
                
                if response.response?.statusCode == STATUS_CODE.VALIDATION_ERROR{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.FORBIDDEN{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.NOT_FOUND{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "NOT FOUND", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.UNAUTHENTICATED{
                    ServerErrorHandling.updateAccessToken()
                    Alert.hideLoader()
                    
                    return
                }
                Alert.hideLoader()
                
                if isShowError {
                    self.showAlertView(message: (response.result.error!).localizedDescription as NSString, title: "Error From Server")
                }
                
                break
            }
        }
    }
    
    
    
    
    
    
    /**
     ** GET Method for calling API
     *  Services gateway
     *  Method  get response from server
     *  @parameter              -> requestObject: request josn object ,apiName: api endpoint
     *  @returm                 -> void
     *  @compilationHandler     -> success: status of api, response: respose from server, error: error handling
     **/
    static func requestWithGET( apiName : String,
                                completionHandler:
        @escaping (_ success : Bool, _ response : JSON, _ error : AnyObject?) -> Void) {
        
        print(apiName);
        
        //Mark check internet Connectivity
        if !ConnectionHelper.sharedInstance.isConnectedToNetwork(){
            Alert.hideLoader()
            Alert.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to internet");
            return;
        }
        
        Alert.showLoader(message: "")
        
        Alamofire.request(apiName, method: .get, parameters: ["":""], encoding: URLEncoding.default, headers:APIManager.headers() ).responseJSON { (response:DataResponse<Any>) in
            
            Alert.hideLoader();
            switch(response.result) {
            case .success(let data):
                
                
                print(response)
                /* if response.result.value != nil{
                 print(data as! NSDictionary)
                 completionHandler(true, data as! JSON ,nil)
                 }
                 break*/
                if let value: Any = response.result.value as AnyObject? {
                    let response = JSON(value)
                    
                    completionHandler(true, response   ,nil)
                    // let response = JSON(value)
                }
                
            case .failure(_):
                print("Request failed with error: \(response.result.error!)")
                //403,200
                
                print((response.result.error! as NSError).localizedDescription)
                
                if response.response?.statusCode == STATUS_CODE.VALIDATION_ERROR{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.FORBIDDEN{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.NOT_FOUND{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "NOT FOUND", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.UNAUTHENTICATED{
                    ServerErrorHandling.updateAccessToken()
                    Alert.hideLoader()
                    
                    return
                }
                Alert.hideLoader()
                
                if isShowError {
                    self.showAlertView(message: (response.result.error!).localizedDescription as NSString, title: "Error From Server")
                }
                
                break
                
            }
            
        }
        
    }
    
    static func requestWithGETWithoutLoader( apiName : String,
                                             completionHandler:
        @escaping (_ success : Bool, _ response : JSON, _ error : AnyObject?) -> Void) {
        
        print(apiName);
        
        //Mark check internet Connectivity
        if !ConnectionHelper.sharedInstance.isConnectedToNetwork(){
            //            Alert.hideLoader()
            //            Alert.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to internet");
            return;
        }
        
        Alamofire.request(apiName, method: .get, parameters: ["":""], encoding: URLEncoding.default, headers:APIManager.headers() ).responseJSON { (response:DataResponse<Any>) in
            
            //Alert.hideLoader();
            switch(response.result) {
            case .success(let data):
                
                
                print(response)
                /* if response.result.value != nil{
                 print(data as! NSDictionary)
                 completionHandler(true, data as! JSON ,nil)
                 }
                 break*/
                if let value: Any = response.result.value as AnyObject? {
                    let response = JSON(value)
                    
                    completionHandler(true, response   ,nil)
                    // let response = JSON(value)
                }
                
            case .failure(_):
                //print("Request failed with error: \(response.result.error!)")
                //403,200
                
                print((response.result.error! as NSError).localizedDescription)
                
                if response.response?.statusCode == STATUS_CODE.VALIDATION_ERROR{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                }
                
                if response.response?.statusCode == STATUS_CODE.FORBIDDEN{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                }
                
                if response.response?.statusCode == STATUS_CODE.NOT_FOUND{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                }
                
                if response.response?.statusCode == STATUS_CODE.UNAUTHENTICATED{
                    
                    return
                }
                
                break
                
            }
        }
        
    }
    
    // Show the alert View
    static func showAlertView (message:NSString,title:NSString) {
        
        Alert.showAlert(title: title as String, message: message as String)
        
    }
    
    static func requestWithPOSTHeader(header:[String:String],parameters:[String:Any], apiName : String,
                                      completionHandler:
        @escaping (_ success : Bool, _ response : JSON, _ error : AnyObject?) -> Void) {
        print(apiName);
        
        //Mark check internet Connectivity
        if !ConnectionHelper.sharedInstance.isConnectedToNetwork(){
            Alert.hideLoader()
            Alert.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to internet");
            return;
        }
        //   Alert.showLoader(message: "")
        Alert.hideLoader();
        
        
        Alamofire.request(apiName, method:HTTPMethod.post, parameters: parameters , encoding: JSONEncoding.default, headers: header).responseJSON { (response:DataResponse<Any>) in
            
            Alert.hideLoader();
            
            switch(response.result) {
            case .success(let data):
                
                Alert.hideLoader();
                
                print(response)
                /* if response.result.value != nil{
                 print(data as! NSDictionary)
                 completionHandler(true, data as! JSON ,nil)
                 }
                 break*/
                if let value: Any = response.result.value as AnyObject? {
                    let response = JSON(value)
                    completionHandler(true, response   ,nil)
                    Alert.hideLoader();
                    // let response = JSON(value)
                }
                
                
            case .failure(_):
                print("Request failed with error: \(response.result.error!)")
                //403,200
                
                print((response.result.error! as NSError).localizedDescription)
                
                if response.response?.statusCode == STATUS_CODE.VALIDATION_ERROR{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.FORBIDDEN{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.NOT_FOUND{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "NOT FOUND", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.UNAUTHENTICATED{
                    ServerErrorHandling.updateAccessToken()
                    Alert.hideLoader()
                    
                    return
                }
                Alert.hideLoader()
                
                if isShowError {
                    self.showAlertView(message: (response.result.error!).localizedDescription as NSString, title: "Error From Server")
                }
                
                break
                
            }
            
            
        }
        
    }
    
    
    
    static func requestWithGETHeader(header:[String:String],parameters:[String:Any], apiName : String,
                                     completionHandler:
        @escaping (_ success : Bool, _ response : JSON, _ error : AnyObject?) -> Void) {
        print(apiName);
        
        //Mark check internet Connectivity
        if !ConnectionHelper.sharedInstance.isConnectedToNetwork(){
            Alert.hideLoader()
            Alert.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to internet");
            return;
        }
        
        Alert.showLoader(message: "")
        
        
        
        
        Alamofire.request(apiName, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: header).responseJSON{ (response:DataResponse<Any>) in
            Alert.hideLoader();
            
            switch(response.result) {
            case .success(let data):
                
                Alert.hideLoader();
                
                print(response)
                /* if response.result.value != nil{
                 print(data as! NSDictionary)
                 completionHandler(true, data as! JSON ,nil)
                 }
                 break*/
                if let value: Any = response.result.value as AnyObject? {
                    let response = JSON(value)
                    completionHandler(true, response   ,nil)
                    // let response = JSON(value)
                }
                
                
            case .failure(_):
                print("Request failed with error: \(response.result.error!)")
                //403,200
                
                print((response.result.error! as NSError).localizedDescription)
                
                if response.response?.statusCode == STATUS_CODE.VALIDATION_ERROR{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.FORBIDDEN{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.NOT_FOUND{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "NOT FOUND", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.UNAUTHENTICATED{
                    ServerErrorHandling.updateAccessToken()
                    Alert.hideLoader()
                    
                    return
                }
                Alert.hideLoader()
                
                if isShowError {
                    self.showAlertView(message: (response.result.error!).localizedDescription as NSString, title: "Error From Server")
                }
                
                break
                
            }
        }
    }
    
    static func requestWithGETHeader1(header:[String:String],parameters:[String:Any], apiName : String,
                                      completionHandler:
        @escaping (_ success : Bool, _ response : JSON, _ error : AnyObject?) -> Void) {
        print(apiName);
        
        //Mark check internet Connectivity
        if !ConnectionHelper.sharedInstance.isConnectedToNetwork(){
            Alert.hideLoader()
            Alert.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to internet");
            return;
        }
        
        Alert.showLoader(message: "")
        
        
        let header1 =  ["Authorization":"Bearer cf84950a5509bc24656e3b746e905b484e4e746b"]
        
        Alamofire.request(apiName, method: .get, parameters: nil,encoding: URLEncoding.queryString, headers: header1).validate(statusCode: 200..<500).responseString { (response:DataResponse<String>) in
            print(response)
        }
        
        Alamofire.request(apiName, method: .get, parameters: nil,encoding: URLEncoding.default, headers: header1).responseData { (response:DataResponse<Data>) in
            print(response)
        }
        
        
        
        
        Alamofire.request(apiName, method: .get, parameters: parameters, headers: header).responseJSON{ (response:DataResponse<Any>) in
            Alert.hideLoader();
            
            switch(response.result) {
            case .success(let data):
                
                Alert.hideLoader();
                
                print(response)
                /* if response.result.value != nil{
                 print(data as! NSDictionary)
                 completionHandler(true, data as! JSON ,nil)
                 }
                 break*/
                if let value: Any = response.result.value as AnyObject? {
                    let response = JSON(value)
                    completionHandler(true, response   ,nil)
                    // let response = JSON(value)
                }
                
                
            case .failure(_):
                print("Request failed with error: \(response.result.error!)")
                //403,200
                
                print((response.result.error! as NSError).localizedDescription)
                
                if response.response?.statusCode == STATUS_CODE.VALIDATION_ERROR{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.FORBIDDEN{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.NOT_FOUND{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "NOT FOUND", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.UNAUTHENTICATED{
                    ServerErrorHandling.updateAccessToken()
                    Alert.hideLoader()
                    
                    return
                }
                Alert.hideLoader()
                
                if isShowError {
                    self.showAlertView(message: (response.result.error!).localizedDescription as NSString, title: "Error From Server")
                }
                
                break
                
            }
            
            
        }
    }
    
    
    static func requestWithGETWithParam(parameters:[String:Any], apiName : String,
                                        completionHandler:
        @escaping (_ success : Bool, _ response : JSON, _ error : AnyObject?) -> Void) {
        print(apiName);
        
        //Mark check internet Connectivity
        if !ConnectionHelper.sharedInstance.isConnectedToNetwork(){
            Alert.hideLoader()
            Alert.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to internet");
            return;
        }
        
        Alert.showLoader(message: "")
        
        Alamofire.request(apiName, method: .get, parameters: parameters, encoding: URLEncoding.queryString,headers:APIManager.headers() ).validate().responseJSON{ (response:DataResponse<Any>) in
            
            Alert.hideLoader();
            
            switch(response.result) {
            case .success(let data):
                
                Alert.hideLoader();
                
                print(response)
                /* if response.result.value != nil{
                 print(data as! NSDictionary)
                 completionHandler(true, data as! JSON ,nil)
                 }
                 break*/
                
                if let value: Any = response.result.value as AnyObject? {
                    let response = JSON(value)
                    let dic = response.dictionaryObject
                    print("--------Response In JSON Format-----")
                    print(dic?.prettyPrintedJSON ?? "")
                    completionHandler(true, response   ,nil)
                    // let response = JSON(value)
                }
                
                
            case .failure(_):
                print("Request failed with error: \(response.result.error!)")
                //403,200
                
                print((response.result.error! as NSError).localizedDescription)
                
                if response.response?.statusCode == STATUS_CODE.VALIDATION_ERROR{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.FORBIDDEN{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.NOT_FOUND{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "NOT FOUND", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.UNAUTHENTICATED{
                    ServerErrorHandling.updateAccessToken()
                    Alert.hideLoader()
                    
                    return
                }
                Alert.hideLoader()
                
                if isShowError {
                    self.showAlertView(message: (response.result.error!).localizedDescription as NSString, title: "Error From Server")
                }
                
                break
                
            }
            
            
        }
    }
    
    
    static func requestWithGETWithParam_WithOutLoader(parameters:[String:Any], apiName : String,
                                                      completionHandler:
        @escaping (_ success : Bool, _ response : JSON, _ error : AnyObject?) -> Void) {
        print(apiName);
        
        //Mark check internet Connectivity
        if !ConnectionHelper.sharedInstance.isConnectedToNetwork(){
            Alert.hideLoader()
            Alert.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to internet");
            return;
        }
        
        
        Alamofire.request(apiName, method: .get, parameters: parameters, encoding: URLEncoding.queryString,headers:APIManager.headers() ).validate().responseJSON{ (response:DataResponse<Any>) in
            
            
            switch(response.result) {
            case .success(let data):
                
                
                print(response)
                /* if response.result.value != nil{
                 print(data as! NSDictionary)
                 completionHandler(true, data as! JSON ,nil)
                 }
                 break*/
                
                if let value: Any = response.result.value as AnyObject? {
                    let response = JSON(value)
                    let dic = response.dictionaryObject
                    print("--------Response In JSON Format-----")
                    print(dic?.prettyPrintedJSON ?? "")
                    completionHandler(true, response   ,nil)
                    // let response = JSON(value)
                }
                
                
            case .failure(_):
                print("Request failed with error: \(response.result.error!)")
                //403,200
                
                print((response.result.error! as NSError).localizedDescription)
                
                if response.response?.statusCode == STATUS_CODE.VALIDATION_ERROR{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.FORBIDDEN{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.NOT_FOUND{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "NOT FOUND", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.UNAUTHENTICATED{
                    ServerErrorHandling.updateAccessToken()
                    Alert.hideLoader()
                    
                    return
                }
                Alert.hideLoader()
                
                if isShowError {
                    //self.showAlertView(message: (response.result.error!).localizedDescription as NSString, title: "Error From Server")
                }
                
                break
                
            }
        }
    }
    
    
    
    static func requestWithPOST_forRawData( parameters:[String:Any], apiName : String,
                                            completionHandler:
        @escaping (_ success : Bool, _ response : JSON, _ error : AnyObject?) -> Void) {
        print(apiName);
        
        //Mark check internet Connectivity
        if !ConnectionHelper.sharedInstance.isConnectedToNetwork(){
            Alert.hideLoader()
            Alert.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to internet");
            return;
        }
        Alert.showLoader(message: "")
        
        Alamofire.request(apiName, method:HTTPMethod.post, parameters: parameters , encoding:  JSONEncoding.default, headers: APIManager.headersForJsonEncoding()).responseJSON { (response:DataResponse<Any>) in
            
            Alert.hideLoader();
            
            switch(response.result) {
            case .success(let data):
                
                
                print(response)
                /* if response.result.value != nil{
                 print(data as! NSDictionary)
                 completionHandler(true, data as! JSON ,nil)
                 }
                 break*/
                if let value: Any = response.result.value as AnyObject? {
                    let response = JSON(value)
                    completionHandler(true, response   ,nil)
                    // let response = JSON(value)
                }
                
                
            case .failure(_):
                print("Request failed with error: \(response.result.error!)")
                //403,200
                
                print((response.result.error! as NSError).localizedDescription)
                
                if response.response?.statusCode == STATUS_CODE.VALIDATION_ERROR{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.FORBIDDEN{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "ALERT", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.NOT_FOUND{
                    let response_json = JSON(response.data)
                    
                    print(response_json)
                    
                    if isShowError {
                        Alert.showAlert(title: "NOT FOUND", message: response_json["message"].string ?? "no error in message")
                    }
                }
                
                if response.response?.statusCode == STATUS_CODE.UNAUTHENTICATED{
                    ServerErrorHandling.updateAccessToken()
                    Alert.hideLoader()
                    
                    return
                }
                Alert.hideLoader()
                
                if isShowError {
                    self.showAlertView(message: (response.result.error!).localizedDescription as NSString, title: "Error From Server")
                }
                
                break
                
            }
            
            
        }
        
    }
    
    func getAuthorizationHeader () -> Dictionary<String,String>{
        
        // if let token = Singleton.sharedInstance.CurrentUser!.token {
        //   return ["token":token,"Content-Type":"application/json"]
        //  }
        return ["Content-Type":"application/json"]
    }
    
}
