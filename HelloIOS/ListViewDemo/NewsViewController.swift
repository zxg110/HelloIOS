//
//  NewsViewController.swift
//  HelloIOS
//
//  Created by zxg on 2018/9/26.
//  Copyright © 2018年 zxg. All rights reserved.
//

import UIKit

class NewsViewController: UITableViewController {
    
    //模拟数据源
    let newsItem = [News(title: "吴秀波出轨", desc: "吴秀波圈养小妾"),News(title: "中美贸易升级", desc: "美提升2000亿关税"),News(title: "海底捞上市", desc: "创始人张勇暴富"),News(title: "全国喜迎十一长假", desc: "国庆黄金周即将来临"),News(title: "全国喜迎十一长假", desc: "国庆黄金周即将来临"),News(title: "全国喜迎十一长假", desc: "国庆黄金周即将来临"),News(title: "全国喜迎十一长假", desc: "国庆黄金周即将来临"),News(title: "全国喜迎十一长假", desc: "国庆黄金周即将来临"),News(title: "全国喜迎十一长假", desc: "国庆黄金周即将来临"),News(title: "全国喜迎十一长假", desc: "国庆黄金周即将来临"),News(title: "全国喜迎十一长假", desc: "国庆黄金周即将来临")]
    let cellIdentifier = "NewsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //将TableView背景横线去掉
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        self.navigationController?.setToolbarHidden(false, animated: true)
        //两种register方式：
        //通过UINib注册，适用于xib方式，本例中，cell采用的是xib方式而非纯代码。
        let nib = UINib.init(nibName: "NewsViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        
        /*通过class注册，适用于纯代码方式，需要在cell文件中重写init(style: UITableViewCellStyle, reuseIdentifier: String?)
          在其中初始化view
        */
        //tableView.register(NewsViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    //UITableViewDataSource委托协议：返回小节的数量
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    //UITableViewDataSource委托协议：返回每个小节的item数量，section为小节Index
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsItem.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        /*使用dequeueReusableCell(withIdentifier: cellIdentifier)方法获取cell不需要通过register注册，但是要判断cell是否为空，为空则new cell
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? NewsViewCell

        if(cell == nil){
            cell = NewsViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellIdentifier)
        } */

        /*使用dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)获取cell，其实就使用了tableview的缓存机制，当取到cell为空时
          系统会帮忙创建register的cell，所以就不需要我们手动判空并实例化cell。所以必须register
        */
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NewsViewCell
        let row = indexPath.row
        let news:News = newsItem[row]
        cell?.tvNewsTitle?.text = news.title
        cell?.tvNewsDesc?.text = news.desc
        return cell!
//        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NewsViewCell{
//           let row = indexPath.row
//           let news:News = newsItem[row]
//           cell.tvNewsTitle.text = news.title
//           cell.tvNewsDesc.text = news.desc
//           return cell
//        }
//        return cell
    }
    //返回每个cell的高度
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}
