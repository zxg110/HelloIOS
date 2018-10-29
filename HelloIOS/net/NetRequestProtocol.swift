//
//  NetRequestProtocol.swift
//  HelloIOS
//
//  Created by zxg on 2018/10/29.
//  Copyright © 2018年 zxg. All rights reserved.
//

import Foundation

protocol NetRequestProtocol {
    func getParams()->Dictionary<String, String>
    
    func getOperation() ->String
    
    func getMethod()-> NetMethod
    
    func transformSuccessResponse()->NSObject
    
}

enum NetMethod:Int{
    case GET = 1;
    case POST = 2;
}

extension NetRequestProtocol{
    
}
