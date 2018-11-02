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
import HandyJSON

class HttpRestfulClient {
    static let sharedInstance = HttpRestfulClient()
    
    private init() {}
    //    let device_id: Int = 6096495334
    //    let iid: Int = 5034850950

    
    //Demo
    //这里使用了逃逸闭包，因为responseJson为异步，所以当网络请求结果回来后，事实上testRequest()方法已经执行完了。那么
    //传入函数testRequest()的闭包是在testRequest()函数执行完后，才要执行的，也就是说这个闭包已经逃逸到函数外部了。所以要加该注解
    //swift3.0默认是非逃逸的
    //弊端
    //该方法拿到数据后，字节解析字段，破坏了封装性。合理的做法应该是封装成model，再调用闭包，把model给出去
    public func testRequset<T:HandyJSON>(_ completionHandler: @escaping(_ dataFromNet:AnyObject)->(),_ protocol:BaseProtocol<T>){
        //        let params = ["device_id": device_id, "iid": iid]
        //        Alamofire.request("https://is.snssdk.com/search/suggest/homepage_suggest/?", method: .get, parameters params).responseString{
        //            (response) in
        //            if let value = response.result.value{
        //                print("value:",value5034850950)
        //                let json = JSON(value)
        //                print(json)
        //                guard json["message"] == "success" else {return}
        //
        //                if let data = json["data"].dictionary{
        //                    completionHandler(data["homepage_search_suggest"]!.string!)
        //                }
        //                let responseModel = BaseResponse<T>.deserialize(from: value)!
        //                print("model:",responseModel.data)
        //                completionHandler((responseModel.data as? AnyObject)!)
        //            }
        //        }
    }
    
    public func sendRequset<T:HandyJSON>(_ netProtocol:BaseProtocol<T>,_ competionHandler:@escaping(_ model:AnyObject?,_ error:NetError)->()){
        var error:NetError = NetError.SUCCESS
        Alamofire.request(netProtocol.getOpertion()!,
                          method: transformMethod(netProtocol.getMethod()),
                          parameters: netProtocol.getParams()).responseString{
                            (response) in
                            if let value = response.result.value{
                                print("value:",value)
                                let responseModel = BaseResponse<T>.deserialize(from: value)!
                                if(responseModel.message! != "success"){
                                    error = NetError.DATA_ERROR
                                }
                                competionHandler(responseModel.data as? AnyObject,error)
                            }
        }
    }
    
    //自定义NetMethod转Alamofire.HTTPMethod,目的是对上层完全隐藏Alamofire，这样即使换掉Alamofire框架
    //上层也不需要改动
    private func transformMethod(_ method:NetMethod)->HTTPMethod{
        switch method {
        case .GET:
            return HTTPMethod.get
        case .POST:
            return HTTPMethod.post
        default:
            return HTTPMethod.get
        }
    }
    
    enum NetError:Int{
        case SUCCESS = 0;
        case DATA_ERROR = 1;
    }
    
    enum NetMethod:Int{
        case GET = 10;
        case POST = 20;
    }
}
