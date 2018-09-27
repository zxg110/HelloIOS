//
//  News.swift
//  HelloIOS
//
//  Created by zxg on 2018/9/27.
//  Copyright © 2018年 zxg. All rights reserved.
//

import UIKit

class News: NSObject {
    
    var title:String = "" //新闻标题
    var desc:String = "" //新闻描述
    
    init(title:String,desc:String){
        self.title = title
        self.desc = desc
    }


}
