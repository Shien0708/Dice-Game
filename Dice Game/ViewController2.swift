//
//  ViewController2.swift
//  Dice Game
//
//  Created by 方仕賢 on 2021/12/31.
//

import Foundation
import UIKit

class ViewController2: UIViewController {
    
    //顯示骰盅的 image view
    @IBOutlet weak var playerDiceCupImageView: UIImageView!
    @IBOutlet weak var comDiceCupImageView: UIImageView!
    
    //選擇骰子點數的segmented control
    @IBOutlet weak var numberSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberSegmentedControl2: UISegmentedControl!
    
    //顯示被選擇的骰子點數 label
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberLabel2: UILabel!
    
    //選擇骰子數量的 stepper
    @IBOutlet weak var countStepper: UIStepper!
    @IBOutlet weak var countStepper2: UIStepper!
    
    //顯示被選擇的骰子數量 label
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countLabel2: UILabel!
    
    //顯示數量錯誤的 label
    @IBOutlet weak var compWarningLabel: UILabel!
    @IBOutlet weak var playerWarningLabel: UILabel!
    
    //顯示玩家喊出的結果
    @IBOutlet weak var playerCallLabel: UILabel!
    @IBOutlet weak var compCallLabel: UILabel!
    
    //顯示為該玩家回合的 label
    @IBOutlet weak var roundLabel: UILabel!
    
    //顯示窺視自己點數的 label
    @IBOutlet weak var compPeekLabel: UILabel!
    
    //顯示該局贏家及輸家的 label
    @IBOutlet weak var compConclusionLabel: UILabel!
    @IBOutlet weak var playerConclusionLabel: UILabel!
    
    //顯示兩邊骰子相加的 view
    @IBOutlet weak var totalView: UIView!
    
    //顯示美的點數總數量的 label
    @IBOutlet weak var oneTotalLabel: UILabel!
    @IBOutlet weak var twoTotalLabel: UILabel!
    @IBOutlet weak var threeTotalLabel: UILabel!
    @IBOutlet weak var fourTotalLabel: UILabel!
    @IBOutlet weak var fiveTotalLabel: UILabel!
    @IBOutlet weak var sixTotalLabel: UILabel!
    
    //player's dices
    
    @IBOutlet weak var playerDiceImageView: UIImageView!
    @IBOutlet weak var playerDiceImageView2: UIImageView!
    @IBOutlet weak var playerDiceImageView3: UIImageView!
    @IBOutlet weak var playerDiceImageView4: UIImageView!
    @IBOutlet weak var playerDiceImageView5: UIImageView!
    @IBOutlet weak var playerDiceImageView6: UIImageView!
    
    // computer's dices
    @IBOutlet weak var compDiceImageView: UIImageView!
    @IBOutlet weak var compDiceImageView2: UIImageView!
    @IBOutlet weak var compDiceImageView3: UIImageView!
    @IBOutlet weak var compDiceImageView4: UIImageView!
    @IBOutlet weak var compDiceImageView5: UIImageView!
    @IBOutlet weak var compDiceImageView6: UIImageView!
    
    //喊出吹牛結果的按鈕
    @IBOutlet weak var playerCallButton: UIButton!
    @IBOutlet weak var compCallButton: UIButton!
    
    //控制窺視點數的開關
    @IBOutlet weak var compPeekSwitch: UISwitch!
    @IBOutlet weak var playerPeekSwitch: UISwitch!
    
    //擲骰子的按鈕
    @IBOutlet weak var rowDiceButton: UIButton!
    
    //復原遊戲的按鈕
    @IBOutlet weak var resetButton: UIButton!
    
    //抓吹牛的按鈕
    @IBOutlet weak var compCatchButton: UIButton!
    @IBOutlet weak var playerCatchButton: UIButton!
    
    //骰子六面的圖片
    let dices = ["one", "two", "three", "four", "five", "six"]
    
    //玩家的各點總數
    var playerTotal = [0, 0, 0, 0, 0, 0]
    var compTotal = [0, 0, 0, 0, 0, 0]
    
    //兩個玩家的各點數數量加總
    var total = [0, 0, 0, 0, 0, 0]
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0, green: 1, blue: 0.5, alpha: 0.5)
        
        //當開起遊戲畫面，要隱藏以下物件
        totalView.isHidden = true
        resetButton.isHidden = true
        compCatchButton.isHidden = true
        playerCatchButton.isHidden = true
        compCallButton.isHidden = true
        playerCallButton.isHidden = true
        
        //讓兩個玩家畫面相反
        compPeekLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        compConclusionLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        compWarningLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        compCatchButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        comDiceCupImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        compDiceImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        compCallButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        playerCallLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        compDiceImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        compDiceImageView2.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        compDiceImageView3.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        compDiceImageView4.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        compDiceImageView5.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        compDiceImageView6.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        numberSegmentedControl2.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        numberLabel2.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        countStepper2.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        countLabel2.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }
    
    //隨機改變12顆骰子圖片及點數數量加總的方法
    func changeDicesRandomly(){
        var randomValue: Int = 0
        
        for index in 0...5 {
            
            
            randomValue = Int.random(in: 0...5)
            
            switch index {
            case 0:
                playerDiceImageView.image = UIImage(named: String(dices[randomValue]))
                
                
            case 1:
                playerDiceImageView2.image = UIImage(named: String(dices[randomValue]))
                
            case 2:
                playerDiceImageView3.image = UIImage(named: String(dices[randomValue]))
                
            case 3:
                playerDiceImageView4.image = UIImage(named: String(dices[randomValue]))
                
            case 4:
                playerDiceImageView5.image = UIImage(named: String(dices[randomValue]))
                
            
            default:
                playerDiceImageView6.image = UIImage(named: String(dices[randomValue]))
                
            }
            
            switch randomValue {
            case 0:
                
                playerTotal[0] += 1
            case 1:
                
                playerTotal[1] += 1
            case 2:
               
                playerTotal[2] += 1
            case 3:
                
                playerTotal[3] += 1
            case 4:
                
                playerTotal[4] += 1
            
            default:
            
                playerTotal[5] += 1
            }
            
            
        }
        
        for index in 0...5 {
            
            randomValue = Int.random(in: 0...5)
            
            switch index {
            case 0:
                compDiceImageView.image = UIImage(named: String(dices[randomValue]))
                
                
            case 1:
                compDiceImageView2.image = UIImage(named: String(dices[randomValue]))
                
                
            case 2:
                compDiceImageView3.image = UIImage(named: String(dices[randomValue]))
                
                
            case 3:
                compDiceImageView4.image = UIImage(named: String(dices[randomValue]))
                
                
            case 4:
                compDiceImageView5.image = UIImage(named: String(dices[randomValue]))
                
            
            default:
                compDiceImageView6.image = UIImage(named: String(dices[randomValue]))

            }
            
            switch randomValue {
            case 0:
                
                compTotal[0] += 1
            case 1:
                
                compTotal[1] += 1
            case 2:
               
                compTotal[2] += 1
            case 3:
                
                compTotal[3] += 1
            case 4:
                
                compTotal[4] += 1
            
            default:
                
                compTotal[5] += 1
            }
            
            
        }
        
        oneTotalLabel.text = "\(playerTotal[0]+compTotal[0])"
        twoTotalLabel.text = "\(playerTotal[1]+compTotal[1])"
        threeTotalLabel.text = "\(playerTotal[2]+compTotal[2])"
        fourTotalLabel.text = "\(playerTotal[3]+compTotal[3])"
        fiveTotalLabel.text = "\(playerTotal[4]+compTotal[4])"
        sixTotalLabel.text = "\(playerTotal[5]+compTotal[5])"
        
        for index in 0...5 {
            total[index] = playerTotal[index] + compTotal[index]
        }
        
    }
    
    //從黑色 Row 按鈕連出一個擲骰子的方法
    @IBAction func rowTheDices(_ sender: UIButton) {
        
        changeDicesRandomly()
        rowDiceButton.isHidden = true
        playerCallButton.isHidden = false
        
    }
    
    //從玩家一的 Peek 開關連出一個切換窺視點數的方法
    @IBAction func peekTheOutcome(_ sender: UISwitch) {
        
        if sender.isOn {
            playerDiceCupImageView.alpha = 0.5
        } else {
            playerDiceCupImageView.alpha = 1

        }
        
    }
    
    //從玩家二的 Peek 開關連出一個切換窺視點數的方法
    @IBAction func compPeekTheOutcome(_ sender: UISwitch) {
        
        if sender.isOn {
            
            comDiceCupImageView.alpha = 0.5

        } else {
            comDiceCupImageView.alpha = 1
        }
       
    }
    
    //從玩家一的褐色 Call 按鈕連出一個喊話的方法
    @IBAction func speak(_ sender: UIButton) {
        
        ////如果玩家選擇的個數校於對方的，或是個數跟點數小於等於對方的，會顯示警告，否則顯示選擇內容
        if countStepper.value < countStepper2.value || countStepper.value <= countStepper2.value && numberSegmentedControl.selectedSegmentIndex <= numberSegmentedControl2.selectedSegmentIndex {
            
           
            playerWarningLabel.text = "Your count or point must greater than the other player's!"
            
            
        } else {
            
            //如果該玩家的 stepper value 小於 1，就顯示There is ，否則顯示 There are
            playerCallLabel.text = countStepper.value <= 1 ? "There is " : "There are "
            
            //在 There is 或 There are 後面加入點數與個數的字串
            playerCallLabel.text! += "\(Int(countStepper.value)) point \(numberSegmentedControl.selectedSegmentIndex+1)"
            
            playerWarningLabel.text = ""
            
            //輪到對方玩家的標誌
            roundLabel.text = "⬆️"
            
            //至少第一次喊完才能出現抓人的按鈕
            compCatchButton.isHidden = false
            
            playerCallButton.isHidden = true
            compCallButton.isHidden = false
        }
        
        
    }
    
    @IBAction func compSpeak(_ sender: UIButton) {
        
        if countStepper2.value < countStepper.value || countStepper2.value <= countStepper.value && numberSegmentedControl2.selectedSegmentIndex <= numberSegmentedControl.selectedSegmentIndex {
            
            compWarningLabel.text = "Your count or point must greater than the other player's!"
            
        } else {
            
            
            compCallLabel.text = countStepper2.value <= 1 ? "There is " : "There are "
            
            compCallLabel.text! += "\(Int(countStepper2.value)) point \(numberSegmentedControl2.selectedSegmentIndex+1)"
            
            compWarningLabel.text = ""
            
            roundLabel.text = "⬇️"
            
            playerCatchButton.isHidden = false
            
            compCallButton.isHidden = true
            playerCallButton.isHidden = false
        }
        
    }
    
    //從玩家一的 stepper 連出一個改變個數的方法
    @IBAction func controlDiceCounts(_ sender: UIStepper) {
        
        countLabel.text = "\(Int(sender.value))"
        
    }
    
    //從玩家二的 stepper 連出一個改變個數的方法
    @IBAction func compControlDiceCounts(_ sender: UIStepper) {
        
        countLabel2.text = "\(Int(sender.value))"
        
    }
    
    //從玩家一的 segmented control 連出一個改變點數的方法
    @IBAction func changeNumber(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            numberLabel.text = "One"
        case 1:
            numberLabel.text = "Two"
        case 2:
            numberLabel.text = "Three"
        case 3:
            numberLabel.text = "Four"
        case 4:
            numberLabel.text = "Five"
        default:
            numberLabel.text = "Six"
        }
        
    }
    
    //從玩家二的 segmented control 連出一個改變點數的方法
    @IBAction func compChangeNumber(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            numberLabel2.text = "One"
        case 1:
            numberLabel2.text = "Two"
        case 2:
            numberLabel2.text = "Three"
        case 3:
            numberLabel2.text = "Four"
        case 4:
            numberLabel2.text = "Five"
        default:
            numberLabel2.text = "Six"
        }
        
    }
    
    //宣告一個抓完對家需隱藏物件的方法
    func catchAndHide(){
        playerDiceCupImageView.isHidden = true
        comDiceCupImageView.isHidden = true
        totalView.isHidden = false
        resetButton.isHidden = false
        rowDiceButton.isHidden = true
        playerCallButton.isHidden = true
        compCallButton.isHidden = true
        roundLabel.isHidden = true
        playerCatchButton.isHidden = true
        compCatchButton.isHidden = true
    }
    
   //如果對家當下的點數個數大於雙方點數總個數的話，我家獲勝，否則對家獲勝
        if Int(countStepper2.value) > total[numberSegmentedControl2.selectedSegmentIndex] {
            compConclusionLabel.text = "You lose!"
            playerConclusionLabel.text = "You win!"
        } else {
            compConclusionLabel.text = "You win!"
            playerConclusionLabel.text = "You lose!"
        }
        
        //按完按鈕隱藏一些物件
        catchAndHide()
        
    }
    
    //從玩家二的紅色 Catch 按鈕連出一個抓對家的方法
    @IBAction func compCatch(_ sender: UIButton) {
        
        if Int(countStepper.value) > total[numberSegmentedControl.selectedSegmentIndex] {
            
            compConclusionLabel.text = "You win!"
            playerConclusionLabel.text = "You lose!"
            
        } else {
            
            compConclusionLabel.text = "You lose!"
            playerConclusionLabel.text = "You win!"
        }
        
        catchAndHide()
        
        
    }
    
    //從深藍色 Reset 按鈕連出一個重置遊戲的方法
    @IBAction func resetTheGame(_ sender: UIButton) {
        
        rowDiceButton.isHidden = false
        
        totalView.isHidden = true
        resetButton.isHidden = true
        
        playerCatchButton.isHidden = true
        compCallButton.isHidden = true
        
        playerPeekSwitch.isOn = false
        compPeekSwitch.isOn = false
        
        playerDiceCupImageView.isHidden = false
        comDiceCupImageView.isHidden = false
        rowDiceButton.isHidden = false
        
        playerDiceCupImageView.alpha = 1
        comDiceCupImageView.alpha = 1
        
        countStepper2.value = 0
        countStepper.value = 0
        
        numberSegmentedControl2.selectedSegmentIndex = 0
        numberSegmentedControl.selectedSegmentIndex = 0
        
        compWarningLabel.text = ""
        playerWarningLabel.text = ""
        
        playerConclusionLabel.text = ""
        compConclusionLabel.text = ""
        
        playerCallLabel.text = ""
        compCallLabel.text = ""
        
        countLabel2.text = "0"
        countLabel.text = "0"
        
        numberLabel.text = "One"
        numberLabel2.text = "One"
        
        total = [0, 0, 0, 0, 0, 0]
        playerTotal = [0, 0, 0, 0, 0, 0]
        compTotal = [0, 0, 0, 0, 0, 0]
        
        
        
    }
    
    
}
