//
//  BaseViewController.swift
//  RRTabbar
//
//  Created by 游侠 on 2017/11/13.
//  Copyright © 2017年 ranger. All rights reserved.
//

import UIKit

let WIDTH = UIScreen.main.bounds.width
let HEIGHT = UIScreen.main.bounds.height

class BaseViewController: UITabBarController {

    var customTabbar = RRTabbar()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBar.isHidden = true
        setTabbar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setTabbar() {
        customTabbar = RRTabbar.init(frame: CGRect.init(x: 0, y: self.view.frame.size.height - 49, width: self.view.frame.size.width, height: 49))
        let one = OneViewController()
        let two = TwoViewController()
        let three = ThreeViewController()
        let four = FourViewController()
        let five = FiveViewController()
        var vcArr = [one,two,three,four,five]
        let color_1 = UIColor.red
        let color_2 = UIColor.yellow
        let color_3 = UIColor.blue
        let color_4 = UIColor.black
        let color_5 = UIColor.brown
        let colArr = [color_1,color_2,color_3,color_4,color_5]
        var navArr = [UIViewController]()
        for i in 0..<5 {
            let vv = vcArr[i]
            vv.view.backgroundColor = colArr[i]
            let nav = UINavigationController.init(rootViewController: vv)
            nav.title = "asasaas"
            navArr.append(nav)
        }
        self.viewControllers = navArr
        
        let titleArray = ["哈哈","嘻嘻","吼吼","哇哇","呜呜"]
        let imageArray = ["哈哈","嘻嘻","吼吼","哇哇","呜呜"]
        let selImageArray = ["哈哈sel","嘻嘻sel","吼吼sel","哇哇sel","呜呜sel"]
        let gap:CGFloat = (WIDTH - 49*5)/10
        customTabbar.setTabbarButton(titleNames: titleArray, norImagesNames: imageArray, selImagesNames: selImageArray, gap: gap)
        customTabbar.clickBlock = {(selected:Int) in
            self.selectedIndex = selected
        }
        self.view.addSubview(customTabbar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
