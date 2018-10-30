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
    
    //Demo
    //这里使用了逃逸闭包，因为responseJson为异步，所以当网络请求结果回来后，事实上testRequest()方法已经执行完了。那么
    //传入函数testRequest()的闭包是在testRequest()函数执行完后，才要执行的，也就是说这个闭包已经逃逸到函数外部了。所以要加该注解
    //swift3.0默认是非逃逸的
    //弊端
    //该方法拿到数据后，字节解析字段，破坏了封装性。合理的做法应该是封装成model，再调用闭包，把model给出去
    public func testRequset(_ completionHandler: @escaping(_ dataFromNet:String)->()){
        let params = ["device_id": device_id, "iid": iid]
        Alamofire.request("https://is.snssdk.com/search/suggest/homepage_suggest/?", method: .get, parameters: params).responseJSON{
            (response) in
            if let value = response.result.value{
                print("value:",value)
                let json = JSON(value)
                print(json)
                guard json["message"] == "success" else {return}
            
                if let data = json["data"].dictionary{
                    completionHandler(data["homepage_search_suggest"]!.string!)
                }
            }
        }
    }
    
}
