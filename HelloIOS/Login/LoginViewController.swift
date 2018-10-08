//
//  LoginViewController.swift
//  HelloIOS
//
//  Created by zxg on 2018/9/17.
//  Copyright © 2018年 zxg. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController ,UITextViewDelegate,UITextFieldDelegate{
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var btnUpload: UIButton!
    @IBOutlet weak var switchLeft: UISwitch!
    @IBOutlet weak var lbTip: UILabel!
    @IBOutlet weak var tvUserName: UITextField!

    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var myTimer:Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBAction func btnUpload(_ sender: Any) {
        if(self.loadingView.isAnimating){
            self.loadingView.stopAnimating()
        }else{
            self.loadingView.startAnimating()
        }
        
    }
    @IBAction func onLeftSwitchChange(_ sender: AnyObject) {
        let leftSwitch = sender as! UISwitch
        if(leftSwitch.isOn == true){
            self.lbTip.text = "true"
        }else{
            self.lbTip.text = "false"
        }
    }
    
    @IBAction func onSlideValueChange(_ sender: Any) {
        let slideView = sender as! UISlider
        let progressValue = Double(slideView.value)
        print(progressValue)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginBtnClick(sender:AnyObject){
        goLogin()
    }
    
    private func goLogin(){
        if(tvUserName.text?.isEmpty == true){
            lbTip.text = "请输入用户名"
        }else {
            lbTip.text = "登录成功"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func onDownloadBtnClick(_ sender: Any) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block:{
            (myTimer) in self.download()
        })
        self
    }
    
    func download(){
        self.progressView.progress += 0.1
        if(self.progressView.progress == 1.0){
            myTimer.invalidate()
            self.progressView.progress = 0
            let alert:UIAlertView = UIAlertView(title:"download completed!",message:"completed!",delegate:nil,cancelButtonTitle:"OK")
            alert.show()
        }
    }
    


}
