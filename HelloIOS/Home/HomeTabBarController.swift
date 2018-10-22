//
//  HomeTabBarController.swift
//  HelloIOS
//
//  Created by zxg on 2018/10/22.
//  Copyright © 2018年 zxg. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVC()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func addChildVC(){
        addChildViewController(childVC: HomeViewController(), title: "首页", imgName: "home_icon")
        addChildViewController(childVC: WeitoutiaoViewController(), title: "微头条", imgName: "weitoutiao_icon")
        addChildViewController(childVC: UserInfoViewController(), title: "我的", imgName: "userinfo_icon")
    }
    
    private func addChildViewController(childVC:UIViewController,title:String,imgName:String){
        self.addChildViewController(childVC)
        childVC.tabBarItem.title = title
        childVC.tabBarItem.image = UIImage(named: imgName)
        let selectedImg =  UIImage(named: "userinfo_icon_selected")
        selectedImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        childVC.tabBarItem.selectedImage = selectedImg
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
