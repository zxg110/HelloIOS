//
//  DebugViewController.swift
//  HelloIOS
//
//  Created by zxg on 2018/10/29.
//  Copyright © 2018年 zxg. All rights reserved.
//

import UIKit

class DebugViewController: UIViewController {

    @IBOutlet weak var tvNetData: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var prot:TestNetProtocol = TestNetProtocol()
    //测试访问网络
    @IBAction func testNet(_ sender: Any) {
        prot.device_id = 6096495334
        prot.iid = 5034850950
        print("testNetWork click")
        HttpRestfulClient.sharedInstance.sendRequset(prot,{(model,error) in
            if error != HttpRestfulClient.NetError.SUCCESS {
                print("error")
                return
            }
            if let data = model as? TestNetResponse{
                self.updateUI(model: data)
            }
        })
    }

    
    private func updateUI(model:TestNetResponse){
        self.tvNetData.text = model.homepage_search_suggest!
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
