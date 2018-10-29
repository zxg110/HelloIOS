//
//  HomeTabBarController.swift
//  HelloIOS
//
//  Created by zxg on 2018/10/22.
//  Copyright © 2018年 zxg. All rights reserved.
//

import UIKit
import SwiftTheme

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVC()
        let tabbar = UITabBar.appearance()
        tabbar.theme_tintColor = "colors.tabbarTintColor"
        tabbar.theme_barTintColor = "colors.tableViewBackgroundColor"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func addChildVC(){
        //调用方法时必须加局部参数名，除非参数定义时有外部参数名
        addChildViewController(childVC: HomeViewController(), title: "首页", imgName: "home_icon")
        addChildViewController(childVC: WeitoutiaoViewController(), title: "微头条", imgName: "weitoutiao_icon")
        addChildViewController(childVC:UserInfoViewController(), title:"我的",  imgName:"userinfo_icon")
        addChildViewController(childVC:DebugViewController(), title:"调试",  imgName:"userinfo_icon")
    }
    

    private func addChildViewController(childVC:UIViewController,title:String,imgName:String){
        self.addChildViewController(childVC)
        childVC.tabBarItem.title = title
        childVC.tabBarItem.image = UIImage(named: imgName)
        var selectedImg =  UIImage(named: imgName+"_selected")
        selectedImg = selectedImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        childVC.tabBarItem.selectedImage = selectedImg
    }
    
    //带有外部参数名的函数定义
    func rectangleArea(W width:Double,H height:Double)->Double{
        let area = width*height
        return area
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
