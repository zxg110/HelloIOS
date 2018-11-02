//
//  TestNetProtocol.swift
//  HelloIOS
//
//  Created by zxg on 2018/11/1.
//  Copyright © 2018年 zxg. All rights reserved.
//

import Foundation
import HandyJSON

class TestNetProtocol:BaseProtocol<TestNetResponse>{
    var device_id:Int=0
    var iid:Int=0
    
    override func getParams()->Dictionary<String, AnyObject>?{
        return ["device_id": device_id as AnyObject, "iid": iid as AnyObject];
    }
    
    override func getOpertion()->String?{
        return "https://is.snssdk.com/search/suggest/homepage_suggest/?"
    }

    override func getMethod() -> HttpRestfulClient.NetMethod {
        return HttpRestfulClient.NetMethod.GET
    }
    required init(){
        super.init()
    }
}
