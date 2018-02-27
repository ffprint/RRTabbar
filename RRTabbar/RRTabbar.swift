//
//  RRTabbar.swift
//  RRTabbar
//
//  Created by 游侠 on 2017/11/13.
//  Copyright © 2017年 ranger. All rights reserved.
//

import UIKit
import AudioToolbox

class RRTabbar: UIView {
    var selButton = UIButton()
    var soundId:SystemSoundID = 0
    var clickBlock:((_ selected:Int) ->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        self.isUserInteractionEnabled = true//用户交互打开否则音效播放和动画失效
        self.backgroundColor = UIColor.white
        soundId = buttonAudio("TESTAUDIO.WAV")
        addShadow(offset: CGSize.init(width: 0, height: -1), radius: 1, color: .red, opacity: 0.5)
    }
    
    func setTabbarButton(titleNames:[String],norImagesNames:[String],selImagesNames:[String],gap:CGFloat) {
        for i in 0..<titleNames.count {
            var btn = UIButton.init(type:.custom)
            let image = UIImage.init(named: norImagesNames[i])
            let selImage = UIImage.init(named: selImagesNames[i])
            btn = RRTabbarButton.init(frame: CGRect.init(x: gap + CGFloat(i) * 49 + CGFloat(i) * 2 * gap, y: 0, width: 49, height: 49))
            btn.setImage(image, for: .normal)
            btn.setImage(selImage, for: .selected)
            btn.setTitle(titleNames[i], for: .normal)
            btn.tag = i + 10//不要设为从0开始
            btn.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
            self.addSubview(btn)

            if i == 0 {
                btn.isSelected = true
                selButton = btn
            }
        }
    }
    
    @objc func buttonClick(_ sender:UIButton) {
        let tag = sender.tag - 10
        clickBlock!(tag)
        selButton.isSelected = false
        sender.isSelected = true
        selButton = sender
        AudioServicesPlaySystemSound(soundId)
        buttonAnimation()
    }
    //按键动画
    func buttonAnimation() {
        let ani = CABasicAnimation.init(keyPath: "transform.scale")
        ani.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        ani.duration = 0.08
        ani.repeatCount = 1
        ani.autoreverses = true
        ani.fromValue = Float(0.8)
        ani.toValue = Float(1.2)
        selButton.layer.add(ani, forKey: nil)
    }
    
    //按键音效
    func buttonAudio(_ name:String) -> SystemSoundID {
        //获取音效文件路径
        let filePath = Bundle.main.path(forResource: name, ofType: nil)
        let fileUrl = URL.init(string: filePath!)
        var soundId:SystemSoundID = 0
        //加载音效文件，获取对应的唯一音效id
        AudioServicesCreateSystemSoundID(fileUrl! as CFURL, &soundId)
        //完成播放的回调函数
        AudioServicesAddSystemSoundCompletion(soundId, nil, nil, { (SystemSoundId, data) in
            print("播放完成")
        }, nil)
        //带点震动效果
//        AudioServicesPlayAlertSound(<#T##inSystemSoundID: SystemSoundID##SystemSoundID#>)
        return soundId
    }
    //上端阴影
    func addShadow(offset:CGSize,radius:CGFloat,color:UIColor,opacity:CGFloat) {
        let path = CGMutablePath()
        path.addRect(self.bounds,transform: .identity)
        self.layer.shadowPath = path
        path.closeSubpath()
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = Float(opacity)
        self.clipsToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
