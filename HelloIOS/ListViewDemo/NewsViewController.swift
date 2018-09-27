//
//  NewsViewController.swift
//  HelloIOS
//
//  Created by zxg on 2018/9/26.
//  Copyright © 2018年 zxg. All rights reserved.
//

import UIKit

class NewsViewController: UITableViewController {
    
    let newsItem = [News(title: "吴秀波出轨", desc: "吴秀波圈养小妾"),News(title: "中美贸易升级", desc: "美提升2000亿关税"),News(title: "海底捞上市", desc: "创始人张勇暴富"),News(title: "全国喜迎十一长假", desc: "国庆黄金周即将来临")]
    let cellIdentifier = "NewsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "NewsViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        //tableView.register(NewsViewCell.self, forCellReuseIdentifier: cellIdentifier)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        //该方法中不需要做new cell的操作，IOS缓存机制保证通过dequeueReusableCell可以获取到cell
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NewsViewCell
            let row = indexPath.row
            let news:News = newsItem[row]
            cell.tvNewsTitle?.text = news.title
            cell.tvNewsDesc?.text = news.desc
            return cell
        
//        if(cell == nil){
//            cell = NewsViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellIdentifier)
//        }
//        let row = indexPath.row
//        let news:News = newsItem[row]
//        cell.tvNewsTitle?.text = news.title
//        cell.tvNewsDesc?.text = news.desc
//        return cell
        // Configure the cell...

    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
