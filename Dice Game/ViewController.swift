//
//  ViewController.swift
//  Dice Game
//
//  Created by 方仕賢 on 2021/12/30.
//

import UIKit
import Foundation
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var diceImageView: UIImageView!
    @IBOutlet weak var secondDiceImageView: UIImageView!
    
    @IBOutlet weak var playerOneTotal: UILabel!
    @IBOutlet weak var playerTwoTotal: UILabel!
    
    @IBOutlet weak var moneybagLabel: UILabel!
    
    @IBOutlet weak var playerTwoBet: UILabel!
    @IBOutlet weak var playerOneBet: UILabel!
    
    @IBOutlet weak var player1Conclusion: UILabel!
    @IBOutlet weak var player2Conclusion: UILabel!
    
    @IBOutlet weak var playerOneStepper: UIStepper!
    @IBOutlet weak var playerTwoStepper: UIStepper!
    
    @IBOutlet weak var player1AllinButton: UIButton!
    @IBOutlet weak var player2AllinButton: UIButton!
    
    //玩家的賭金設為初始值 0
    var playerOneBetValue = 0
    var playerTwoBetValue = 0
    
    //玩家的總持有金初始值設為 5000
    var playerOneTotalValue = 5000
    var playerTwoTotalValue = 5000
    
    //利用兩個玩家的指數去取得骰子的數字並比大小
    var playerOneIndex = 0
    var playerTwoIndex = 0
    
    //儲存骰子六面的圖片
    let dices = ["one", "two", "three", "four", "five", "six"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(red: 0, green: 1, blue: 0.6, alpha: 1)
        
        //讓玩家一跟玩家二的畫面顛倒
        secondDiceImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        playerTwoBet.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        playerTwoTotal.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        moneybagLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        player2Conclusion.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        player2AllinButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }
    
    //改變骰子圖片的方法
    func changeDiceImage() {
        
        //隨機取得兩個數子並用該數字呼叫相對應的骰子圖片
        let randomNumber = Int.random(in: 0...5)
        let randomNumber2 = Int.random(in: 0...5)
        
        diceImageView.image = UIImage(named: String(dices[randomNumber]))
        playerOneIndex = randomNumber
        
        secondDiceImageView.image = UIImage(named: String(dices[randomNumber2]))
        playerTwoIndex = randomNumber2

    }
    
    
    //在擲完骰子後更新一些資訊
    func updateAfterRoll() {
        
        playerOneBet.text = "NT$ 0"
        playerTwoBet.text = "NT$ 0"
        
        playerOneBetValue = 0
        playerTwoBetValue = 0
        
        playerOneStepper.value = 0
        playerOneStepper.maximumValue = Double(Float(playerOneTotalValue))
        
        playerTwoStepper.value = 0
        playerTwoStepper.maximumValue = Double(Float(playerTwoTotalValue))
        
    }
    
    //贏家從輸家拿錢的方法
    func takeMoney() {
        //假如玩家一的點數大於玩家二，會取玩家二的賭金，玩家二的持有金會喪失剛剛的賭金。且顯示玩家一為贏家，玩家二為輸家
        if playerOneIndex > playerTwoIndex {
            
            playerOneTotalValue += playerTwoBetValue
            
            playerTwoTotalValue -= playerTwoBetValue
            
            playerOneTotal.text = changeNumberStyle(num: playerTwoTotalValue)
            
            playerTwoTotal.text = changeNumberStyle(num: playerTwoTotalValue)
                        
            player1Conclusion.text = "Winner"
            player2Conclusion.text = "Loser"
            
        } else if playerOneIndex < playerTwoIndex {
            
            playerTwoTotalValue += playerOneBetValue
            
            playerOneTotalValue -= playerOneBetValue
            
            playerOneTotal.text = changeNumberStyle(num: playerOneTotalValue)
            
            playerTwoTotal.text = changeNumberStyle(num: playerTwoTotalValue)
                        
            player2Conclusion.text = "Winner"
            player1Conclusion.text = "Loser"
            
        } else {
            
            //如果平手，顯示平手字樣
            player1Conclusion.text = "Tie"
            player2Conclusion.text = "Tie"
            
        }
        
        
    }
    
    //從淺藍色 Row 按鈕連出一個擲骰子的 IBAction
    @IBAction func rowThedice(_ sender: UIButton) {
        
        //假如玩家一跟二的賭金都大於零，會執行換骰子圖片、取錢及更新的功能
        if playerOneBetValue > 0 && playerTwoBetValue > 0 {
                        
            changeDiceImage()
            
            takeMoney()
            
            updateAfterRoll()
            
        }
        
    
        
    }
    
    //將金錢的數字字樣換成新台幣
    func changeNumberStyle(num: Int) -> String {
            
            let formatter = NumberFormatter()
            
            formatter.numberStyle = .currency
            
        formatter.maximumFractionDigits = 0
        
            formatter.locale = Locale(identifier: "ch-TW")
            
            let moneyString = formatter.string(from: NSNumber(value: num))
        
            
            return moneyString!
        }
    
    //從玩家一的Stepper 連出一個改變玩家一賭金的方法
    @IBAction func changePlayer1Bets(_ sender: UIStepper) {
        
        playerOneBetValue = Int(sender.value)
        
        playerOneBet.text = changeNumberStyle(num: playerOneBetValue)
    }
    
    //從玩家二的Stepper 連出一個改變玩家一賭金的方法
    @IBAction func changePlayer2Bets(_ sender: UIStepper) {
        
       
        playerTwoBetValue = Int(sender.value)
        
        playerTwoBet.text = changeNumberStyle(num: playerTwoBetValue)
    }
    
    //從深藍色 Reset 按鈕連出一個還原遊戲的方法
    @IBAction func resetGame(_ sender: UIButton) {
        
        playerOneBetValue = 0
        playerOneTotalValue = 5000
        playerOneBet.text = "NT$ 0"
        playerOneTotal.text = "NT$ 5000"
        playerOneStepper.maximumValue = 5000
        playerOneStepper.value = 0
        player1Conclusion.text = ""
        
        playerTwoBetValue = 0
        playerTwoTotalValue = 5000
        playerTwoBet.text = "NT$ 0"
        playerTwoTotal.text = "NT$ 5000"
        playerTwoStepper.maximumValue = 5000
        playerTwoStepper.value = 0
        player2Conclusion.text = ""
    }
    
    //從玩家一的紅色按鈕連出一個梭哈的方法
    @IBAction func player1AllIn(_ sender: UIButton) {
        
        playerOneBetValue = playerOneTotalValue
        playerOneStepper.value = Double(playerOneTotalValue)
        playerOneBet.text = changeNumberStyle(num: playerOneBetValue)
        
    }
    
    //從玩家二的紅色按鈕連出一個梭哈的方法
    @IBAction func player2AllIn(_ sender: UIButton) {
        playerTwoBetValue = playerTwoTotalValue
        playerTwoStepper.value = Double(playerTwoTotalValue)
        playerTwoBet.text = changeNumberStyle(num: playerTwoBetValue)
    }
    

}

