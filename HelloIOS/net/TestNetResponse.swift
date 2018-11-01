//
//  TestNetResponse.swift
//  HelloIOS
//
//  Created by zxg on 2018/10/31.
//  Copyright © 2018年 zxg. All rights reserved.
//

import Foundation
import HandyJSON
class TestNetResponse:HandyJSON{
    var call_per_refresh:Int?
    var homepage_search_suggest:String?
    var suggest_words:[SuggestWord]?
    required init(){}
}

class SuggestWord:HandyJSON{
    var id:Int?
    var or:String?
    var word:String?
    required init(){}
}
