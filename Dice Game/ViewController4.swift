//
//  viewController4.swift
//  Dice Game
//
//  Created by 方仕賢 on 2022/1/5.
//

import Foundation
import UIKit

class ViewController4: UIViewController {
    
    //來擺放滑滑圓餅的 view，繼承 WheelView 的 class
    @IBOutlet weak var wheelView: WheelView!
   
    //選擇輪盤分成幾份的 segmented control
    @IBOutlet weak var numSegmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeAWheel(parts: 2)
        
    }
    
    //宣告一個繪製圓餅圖的方法，導入一個被切成多少 part 的參數
    func makeAWheel(parts: Int){
        
        //儲存圓形一度
        let perDegree = CGFloat.pi / 180
        
        //圓的半徑
        let radius:CGFloat = 200
        
        //設定輪盤中心
        let wheelViewCenter = CGPoint(x: wheelView.bounds.width/2, y: wheelView.bounds.height/2)
        
        //開始角度為 270 度
        var startAngle = perDegree * 270
        
        //結束角度 0 度
        var endAngle:CGFloat = perDegree * 0
        
        //當輪盤被切成雙數，顏色為綠跟紅
        let colorForEvenNum = [UIColor.green, UIColor.red]
        
        //當輪盤被切成單數，顏色為綠、紅跟藍
        let colorForOddNum = [UIColor.green, UIColor.red, UIColor.cyan]
        
        //選擇顏色時會用到的指數
        var index = 0
        
        //從第一 part 到最後一 part 每次要做的事
        for part in 1...parts {
            
            // 結束角度為每一次開始角度加上 360 除以指定等份
            endAngle = startAngle + (perDegree * (360/CGFloat(parts)))
            
            //繪製圓圈
            let circle = UIBezierPath()
            
            circle.move(to: wheelViewCenter)
            
            circle.addArc(withCenter: wheelViewCenter, radius: 200, startAngle: startAngle , endAngle: endAngle, clockwise: true)
            
            let circleLayer = CAShapeLayer()
            circleLayer.path = circle.cgPath
            circleLayer.strokeColor = UIColor.black.cgColor
            
            //當圓餅被切成雙數等份，顏色要用雙數的顏色。單數等份則為單數顏色
            if parts % 2 == 0 {
                
                circleLayer.fillColor = colorForEvenNum[index].cgColor
                    
                index = (index + 1) % colorForEvenNum.count
                
            } else {
                
                //當圓餅被切成 7 份且輪到最後一份時，顏色指數要多加1才不會跟第一份顏色重復
                if parts == 7 && part == 7 {
                   
                    index = (index + 2) % colorForOddNum.count
                    
                } else {
                    
                    index = (index + 1) % colorForOddNum.count
                }
                
                circleLayer.fillColor = colorForOddNum[index].cgColor
                
            }
            
            
            circleLayer.lineWidth = 5
        
            wheelView.layer.addSublayer(circleLayer)
            
            //製作每一等份上的數字 label
            let numLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            
             numLabel.text = "\(part)"
            
             numLabel.textColor = .black
            
             numLabel.font = UIFont.systemFont(ofSize: 20)
            
             numLabel.sizeToFit()
            
            //改變每一個數字的角度讓他們朝向圓心
             numLabel.transform = CGAffineTransform(rotationAngle: (startAngle-270*perDegree) + (360/CGFloat(parts)/2*perDegree) )
            
            //繪製數字 label 的路徑
            let labelPath = UIBezierPath()
            
            labelPath.addArc(withCenter: wheelViewCenter, radius: radius-50, startAngle: startAngle, endAngle: endAngle-(perDegree*360/CGFloat(parts)/2), clockwise: true)
             
             let labelLayer = CAShapeLayer()
            
             labelLayer.path = labelPath.cgPath
            
             labelLayer.fillColor = UIColor.clear.cgColor
            
             numLabel.center = labelPath.currentPoint
             
             wheelView.addSubview(numLabel)
             wheelView.layer.addSublayer(labelLayer)
            
            //每一次繪製完一份前，要將結束角度給開始角度
             startAngle = endAngle
        }
        
    }
    
    
    //按按鈕讓輪盤的 view 旋轉
    @IBAction func chooseNum(_ sender: Any) {
        
        wheelView.rotateGradually()
        
    }
    
    //利用segmented control 來選擇輪盤要被分成幾份
    @IBAction func choosePartsOfTheCircle(_ sender: UISegmentedControl) {
        
        
        switch sender.selectedSegmentIndex {
        case 0 :
            makeAWheel(parts: 2)
        case 1:
            makeAWheel(parts: 3)
        case 2:
            makeAWheel(parts: 4)
        case 3:
            makeAWheel(parts: 5)
        case 4:
            makeAWheel(parts: 6)
        case 5:
            makeAWheel(parts: 7)
        case 6:
            makeAWheel(parts: 8)
        case 7:
            makeAWheel(parts: 9)
        case 8:
            makeAWheel(parts: 10)
        case 9:
            makeAWheel(parts: 11)
        default:
            makeAWheel(parts: 12)
            
        }
        
        
    }

    
    
    
}
