//
//  HttpRestfulClient.swift
//  HelloIOS
//
//  Created by zxg on 2018/10/29.
//  Copyright © 2018年 zxg. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HttpRestfulClient {
    static let sharedInstance = HttpRestfulClient()
    
    private init() {}
    let device_id: Int = 6096495334
    let iid: Int = 5034850950

    public func sendRequest(request:NetRequestProtocol){
        let url = request.getOperation()
        let params = ["device_id": device_id, "iid": iid]
        Alamofire.request("https://is.snssdk.com/search/suggest/homepage_suggest/?", method: .get, parameters: params).responseJSON{
            (response) in
            if let value = response.result.value{
                let json = JSON(value)
                print(json)
            }
            
        }
    }
    
    public func testRequset(){
        let params = ["device_id": device_id, "iid": iid]
        Alamofire.request("https://is.snssdk.com/search/suggest/homepage_suggest/?", method: .get, parameters: params).responseJSON{
            (response) in
            if let value = response.result.value{
                print("value:",value)
                
                let json = JSON(value)
                print(json)
            }
        }
    }
    
}
