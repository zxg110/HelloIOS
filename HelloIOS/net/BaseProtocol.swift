//
//  BaseProtocol.swift
//  HelloIOS
//
//  Created by zxg on 2018/10/29.
//  Copyright © 2018年 zxg. All rights reserved.
//

import UIKit
import HandyJSON

class BaseProtocol<T:HandyJSON> {
    func getParams()->Dictionary<String, AnyObject>?{
        return nil;
    }
    
    func getOpertion()->String?{
        return nil
    }
    
    func getMethod()->HttpRestfulClient.NetMethod{
        return HttpRestfulClient.NetMethod.GET
    }

    public required init(){}
}
