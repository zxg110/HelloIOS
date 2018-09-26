//
//  PickViewController.swift
//  HelloIOS
//
//  Created by zxg on 2018/9/25.
//  Copyright © 2018年 zxg. All rights reserved.
//

import UIKit

class PickViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var pickView: UIPickerView!
    
    @IBOutlet weak var btnGetCity: UIButton!
    var pickerData:NSDictionary!
    var pickerProvincesData:NSArray!
    var pickerCityData:NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initData(){
        let plistPath = Bundle.main.path(forResource: "city_plist", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: plistPath!)
        self.pickerData = dict
        self.pickerProvincesData = self.pickerData.allKeys as NSArray
        //默认取出第一个省的所有市
        let selectedProvince = self.pickerProvincesData[0] as! NSString
        self.pickerCityData = self.pickerData[selectedProvince] as! NSArray
        updateLabel()
    }
    
    @IBAction func onGetCityBtnClick(_ sender: Any) {
        updateLabel()
    }
    
    private func updateLabel(){
        //获取当前选中行的index
        let selectedProvinceIndex = self.pickView.selectedRow(inComponent: 0)
        let curProvince = self.pickerProvincesData[selectedProvinceIndex] as? String
        let selectedCityIndex = self.pickView.selectedRow(inComponent: 1)
        let curCity = self.pickerCityData[selectedCityIndex] as? String
        let str:String = "当前省市："+curProvince!+","+curCity!
        dataLabel.text = str
    }
    
    //UIPickerViewDataSource委托协议：为选择器某个转轮的行提供显示数据
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0){
            return self.pickerProvincesData[row] as? String
        }else if(component == 1){
            return self.pickerCityData[row] as? String
        }else {
            return "error"
        }
    }
    
    //UIPickerViewDataSource委托协议：初始化每个转轮的行数，componment为转轮Index
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0){
            return self.pickerProvincesData.count
        }else if(component == 1){
            return self.pickerCityData.count
        }else{
            return 0
        }
    }
    
    //UIPickerViewDelegate委托协议：当选择器转到某一行后调用
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //省转轮转动
        if(component == 0){
            let selectedProvince = self.pickerProvincesData[row] as? String
            self.pickerCityData = self.pickerData[selectedProvince] as? NSArray
            //重新加载市转轮
            self.pickView.reloadComponent(1)
        }
        updateLabel()
    }
    
    //UIPickerViewDelegate委托协议：pickerview转轮数量
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
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
