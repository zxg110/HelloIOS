//
//  ViewController.swift
//  HelloIOS
//
//  Created by zxg on 2018/9/12.
//  Copyright © 2018年 zxg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLab: UITextField!
    @IBOutlet weak var mimaLab: UITextField!
    
    /**
    视图控制器已实例化，视图已被加载到内存中，但视图还未可见
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        addLabel()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /**
     视图即将可见
    */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    /*
     视图已经可见
    */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBOutlet weak var toListBtn: UIButton!
    /*
     视图即将不可见
     @IBAction func toList(_ sender: Any) {
     }
     */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    @IBAction func onGoLoginBtnClick(_ sender: Any) {
        print("去登录")
        let loginViewController = LoginViewController();
        self.present(loginViewController,animated: true,completion: nil)
    }
    
    /*
     视图已经不可见
     */
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    /**
     模态弹出
     */
    @IBAction func goPickerView(_ sender: Any) {
        let pickerViewCont = PickViewController()
        self.present(pickerViewCont,animated:true,completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goList(_ sender: Any) {
        print("into goList")
        let newsListViewCont = NewsViewController()
        self.present(newsListViewCont,animated: true,completion: nil)
    }
    
    //代码添加View
    private func addLabel(){
        let myLabel:UILabel = UILabel()
        //绘制矩形
        myLabel.frame = CGRect(x:300, y: 0, width: 100, height: 200)
        //位置
        myLabel.layer.position = CGPoint(x:self.view.bounds.width/3,y:500)
        myLabel.backgroundColor = UIColor.blue
        myLabel.text = "hello"
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.layer.masksToBounds = true
        self.view.addSubview(myLabel)
    
    }
    
    



}

