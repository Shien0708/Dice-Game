//
//  wheelView.swift
//  Dice Game
//
//  Created by 方仕賢 on 2022/1/5.
//

import UIKit

class WheelView: UIView {

    var currentValue: Double = 0*Double.pi
    
    func rotateGradually() {
        
        //宣告一個轉圈的方法
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        
        //開始轉動
        CATransaction.begin()
        
        //從目前的角度(值)開始轉
        rotateAnimation.fromValue = currentValue
        
        // 產生1~2pi隨機的Double數字,也就是1~360度
        let randomDouble = Double.random(in: Double.pi/180...Double.pi*2)
        
        //開始到結束,總共轉了10圈加上randomDouble度，從到目前角度
        currentValue += randomDouble + (10*Double.pi*2)
    
        //轉到假度為更新的目前角度
        rotateAnimation.toValue = currentValue
        
        //動畫結束後仍保在結束狀態,讓轉盤不會在動畫結束時回到最初狀態。以便再次轉動
        rotateAnimation.isRemovedOnCompletion = false
        
        
        rotateAnimation.fillMode = .forwards
        
        rotateAnimation.duration = 5 //動畫持續時間
        
        rotateAnimation.repeatCount = 1 // 重複幾次
        
        //用cubic Bezier curve決定動畫速率曲線
        rotateAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0, 0.9, 0.4, 1.00)
        
        self.layer.add(rotateAnimation, forKey: nil)
        CATransaction.commit()
    }
    

}
