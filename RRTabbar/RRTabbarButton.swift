//
//  RRTabbarButton.swift
//  RRTabbar
//
//  Created by 游侠 on 2017/11/13.
//  Copyright © 2017年 ranger. All rights reserved.
//

import UIKit

class RRTabbarButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView?.contentMode = .center
        self.setTitleColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), for: .normal)
        self.setTitleColor(#colorLiteral(red: 0, green: 0.5882352941, blue: 1, alpha: 1), for: .selected)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        self.titleLabel?.textAlignment = .center
    }
    //更改image位置
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect.init(x: (contentRect.size.width - 30)/2, y: 2, width: 30, height: 30)
    }
    //更改title位置
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect.init(x: 0, y: contentRect.size.height - 17, width: contentRect.size.width, height: 15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
