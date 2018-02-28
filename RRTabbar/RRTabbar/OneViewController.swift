//
//  OneViewController.swift
//  RRTabbar
//
//  Created by 游侠 on 2017/11/13.
//  Copyright © 2017年 ranger. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {

    var isHiden:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "哈哈"

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isHiden {
            (self.navigationController?.tabBarController as! BaseViewController).customTabbar.hide()
        }else {
            (self.navigationController?.tabBarController as! BaseViewController).customTabbar.show()
        }
        isHiden = !isHiden
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
