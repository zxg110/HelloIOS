//
//  BaseResponse.swift
//  HelloIOS
//
//  Created by zxg on 2018/10/31.
//  Copyright © 2018年 zxg. All rights reserved.
//

import Foundation
import HandyJSON

class BaseResponse<T>:HandyJSON{
    var message:String?
    var data:T?
    public required init(){}
}
