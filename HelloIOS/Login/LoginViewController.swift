//
//  LoginViewController.swift
//  HelloIOS
//
//  Created by zxg on 2018/9/17.
//  Copyright © 2018年 zxg. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController ,UITextViewDelegate,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var btnUpload: UIButton!
    @IBOutlet weak var switchLeft: UISwitch!
    @IBOutlet weak var lbTip: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var tvUserName: UITextField!
    
    @IBOutlet weak var labelTest:UILabel!
    
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
    
    /*委托协议：为选择器中某一行提供数据
     *args:titleForRow:行数id
     *     forComponent:拨轮id 默认从0开始
     */
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//    }
//
    /* 委托协议：可以理解为Java中的callBack，当某行被选中时被调用
     */
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//    }
    
    //返回选择器中拨轮的数量，个人理解为适配器
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    //返回选择器中某个拨轮的行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 10;
        case 1:
            return 20;
        default:
            return 1;
        }
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
