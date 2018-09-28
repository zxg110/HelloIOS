//
//  NewsViewCell.swift
//  HelloIOS
//
//  Created by zxg on 2018/9/26.
//  Copyright © 2018年 zxg. All rights reserved.
//

import UIKit

class NewsViewCell: UITableViewCell {

    @IBOutlet weak var tvNewsTitle: UILabel!
    @IBOutlet weak var tvNewsDesc: UILabel!
    //使用xib方式创建cell，在dequeueReusableCell()时会调用到该方法
    //本例中使用的是xib方式
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //使用纯代码方式创建cell，在dequeueReusableCell()时会调用到该方法
    //需要在该方法中创建view
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        //例如创建如下view:
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.iconImageView=UIImageView()
//        self.contentView.addSubview(self.iconImageView!)
//        self.TitleLabel=UILabel()
//        self.contentView.addSubview(self.TitleLabel!)
//        setUpviews()
//    }
    
    
}
