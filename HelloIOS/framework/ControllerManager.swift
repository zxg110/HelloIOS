//
//  ControllerManager.swift
//  HelloIOS
//
//  Created by zxg on 2018/10/6.
//  Copyright © 2018年 zxg. All rights reserved.
//

import UIKit

class ControllerManager: NSObject {
    
    public func getTopController()->UIViewController{
        var window = UIApplication.shared.keyWindow
        let vc = window?.rootViewController
        return getTopVCWithCurVC(withCurVC:vc!)!
    }
    
    //根据控制器获取顶层控制器
    private func getTopVCWithCurVC(withCurVC:UIViewController)->UIViewController?{
        if(withCurVC == nil){
            print("root vc is nil")
            return nil
        }
        if let presentVC = withCurVC.presentedViewController{
            return getTopVCWithCurVC(withCurVC:presentVC)
        }else if let tabVC  = withCurVC as? UITabBarController{
            if let selectVC = tabVC.selectedViewController{
                return getTopVCWithCurVC(withCurVC:selectVC)
            }
            return nil
        }else if let naiVC = withCurVC as? UINavigationController{
            return getTopVCWithCurVC(withCurVC:naiVC.visibleViewController!)
        }else {
            return withCurVC
        }
    }

}
