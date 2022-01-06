//
//  ViewController3.swift
//  Dice Game
//
//  Created by 方仕賢 on 2022/1/4.
//

import Foundation
import UIKit

class ViewController3: UIViewController {
    
    //顯示 O跟X的分數 label
    @IBOutlet weak var circleScoreLabel: UILabel!
    @IBOutlet weak var crossScoreLabel: UILabel!
    
    //玩家選擇九宮格的 button
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    //玩家選完格子後出現的圖片 image view
    @IBOutlet weak var blockImageView1: UIImageView!
    @IBOutlet weak var blockImageView2: UIImageView!
    @IBOutlet weak var blockImageView3: UIImageView!
    @IBOutlet weak var blockImageView4: UIImageView!
    @IBOutlet weak var blockImageView5: UIImageView!
    @IBOutlet weak var blockImageView6: UIImageView!
    @IBOutlet weak var blockImageView7: UIImageView!
    @IBOutlet weak var blockImageView8: UIImageView!
    @IBOutlet weak var blockImageView9: UIImageView!
    
    //顯示玩家輸贏結果的 view 跟 label
    @IBOutlet weak var winnerView: UIView!
    @IBOutlet weak var winLabel: UILabel!
    
    //顯示玩家順序的 label
    @IBOutlet weak var turnLabel: UILabel!
    
    //儲存玩家選擇九宮格的 array var
    var block = [0,0,0,0,0,0,0,0,0]
    
    //儲存玩家分數的 Int var
    var xScore = 0
    var oScore = 0
    
    //儲存剩下的空白格子 Int var
    var blankBlock = 9
    
    //辨識玩家是 O 還是 X 的 String var
    var playerMark = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        winnerView.isHidden = true
        
    }
    
    //顯示平手的方法
    func displayTie() {
        //當沒有空白格子時執行裡面程式
        if blankBlock == 0 {
            
            winnerView.isHidden = false
            winLabel.text = "Tie"
            turnLabel.isHidden = true
            
        }
    }
    
    //顯示玩家 X 贏的方法
    func xWin() {
        
        winLabel.text = "X Win"
        winnerView.isHidden = false
        xScore += 1
        crossScoreLabel.text = "\(xScore)"
        turnLabel.isHidden = true

    }
    
    //顯示玩家 O 贏的方法
    func oWin() {
        
        winLabel.text = "O Win"
        winnerView.isHidden = false
        oScore += 1
        circleScoreLabel.text = "\(oScore)"
        turnLabel.isHidden = true

    }
    
    //更換順序為玩家 O 的按鈕
    @IBAction func playerCircle(_ sender: UIButton) {
        playerMark = "O"
        turnLabel.text = "It's O's turn."
    }
    
    //更換順序為玩家 Ｘ 的按鈕
    @IBAction func playerCross(_ sender: UIButton) {
        playerMark = "X"
        turnLabel.text = "It's X's turn"
    }
    
    
    //玩家在第一個格子上標記的按鈕
    @IBAction func mark(_ sender: UIButton) {
        
        //玩家按完按鈕空格子就會少一格且該按鈕會消失
        blankBlock -= 1
        button1.isHidden = true
        
        //檢視輪到的是玩家圈還是叉
        if playerMark == "O" {
            
            blockImageView1.image = UIImage(named: "circle")
            
            //玩家是圈的話，block第一個就存 1
            block[0] = 1
            
            //如果以下其中三個block的值相同，就代表連線，否則就檢視是否平手
            if block[0] == block[1] && block[0] == block[2] || block[0] == block[4] && block[0] == block[8] || block[0] == block[3] && block[0] == block[6] {
               
                oWin()
                
            } else {
                
                displayTie()
            }
            
            //自動輪替到玩家 X
            playerMark = "X"
            turnLabel.text = "It's X's turn"

            
        } else {
            blockImageView1.image = UIImage(named: "xmark")
            
            //玩家是圈的話，block第一個就存 2
            block[0] = 2
            
            if block[0] == block[1] && block[0] == block[2] || block[0] == block[4] && block[0] == block[8] || block[0] == block[3] && block[0] == block[6]  {
                xWin()
            } else {
                displayTie()
            }
            
            playerMark = "O"
            turnLabel.text = "It's O's turn."

        }
    
    }
    
    //玩家在第二個格子上標記的按鈕
    @IBAction func mark2(_ sender: Any) {
        
        blankBlock -= 1
        button2.isHidden = true
        
        
        if playerMark == "O" {
            blockImageView2.image = UIImage(named: "circle")
            block[1] = 1
            
            if block[1] == block[4] && block[1] == block[7] ||  block[2] == block[1] && block[1] == block[0] {
                oWin()
            } else {
                displayTie()
            }
            playerMark = "X"
            turnLabel.text = "It's X's turn"


        } else {
            blockImageView2.image = UIImage(named: "xmark")
            block[1] = 2
            
            if block[1] == block[4] && block[1] == block[7] ||  block[2] == block[1] && block[1] == block[0] {
                xWin()
            
            } else {
                displayTie()
            }
            playerMark = "O"
            turnLabel.text = "It's O's turn."

        }
    
    }
    
    //玩家在第三個格子上標記的按鈕
    @IBAction func mark3(_ sender: Any) {
        
        
        blankBlock -= 1
        button3.isHidden = true
        
        if playerMark == "O" {
            blockImageView3.image = UIImage(named: "circle")
            block[2] = 1
            
            if block[2] == block[4] && block[2] == block[6] || block[2] == block[1] && block[2] == block[0] || block[2] == block[5] && block[2] == block[8] {       oWin()
            } else {
                displayTie()
            }
            playerMark = "X"
            turnLabel.text = "It's X's turn"


        } else {
            blockImageView3.image = UIImage(named: "xmark")
            block[2] = 2
            
            if block[2] == block[4] && block[2] == block[6] || block[2] == block[1] && block[2] == block[0] || block[2] == block[5] && block[2] == block[8] {
                xWin()
            } else {
                displayTie()
            }
            playerMark = "O"
            turnLabel.text = "It's O's turn."

        }
  
    }
    
    //玩家在第四個格子上標記的按鈕
    @IBAction func mark4(_ sender: Any) {
        
        blankBlock -= 1
        button4.isHidden = true
    
        
        if playerMark == "O" {
            blockImageView4.image = UIImage(named: "circle")
            block[3] = 1
            if block[3] == block[0] && block[3] == block[6] ||  block[3] == block[4] && block[3] == block[5] {
                oWin()
            } else {
                displayTie()
            }
            playerMark = "X"
            turnLabel.text = "It's X's turn"


        } else {
            blockImageView4.image = UIImage(named: "xmark")
            block[3] = 2
            if block[3] == block[0] && block[3] == block[6] ||  block[3] == block[4] && block[3] == block[5] {
                xWin()

            } else {
                displayTie()
            }
            playerMark = "O"
            turnLabel.text = "It's O's turn."

        }

    }
    
    //玩家在第五個格子上標記的按鈕

    @IBAction func mark5(_ sender: Any) {
        
        blankBlock -= 1
        button5.isHidden = true
        ()

        if playerMark == "O" {
            blockImageView5.image = UIImage(named: "circle")
            block[4] = 1
            
            if block[4] == block[0] && block[4] == block[8] || block[4] == block[1] && block[4] == block[7] || block[4] == block[2] && block[4] == block[6] || block[4] == block[3] && block[4] == block[5] {
                oWin()

            } else {
                displayTie()
            }
            playerMark = "X"
            turnLabel.text = "It's X's turn"



        } else {
            blockImageView5.image = UIImage(named: "xmark")
            block[4] = 2
            
            if block[4] == block[0] && block[4] == block[8] || block[4] == block[1] && block[4] == block[7] || block[4] == block[2] && block[4] == block[6] || block[4] == block[3] && block[4] == block[5] {
                xWin()

            } else {
                displayTie()
            }
            playerMark = "O"
            turnLabel.text = "It's O's turn."

        }
    
    }
    
    //玩家在第六個格子上標記的按鈕
    @IBAction func mark6(_ sender: Any) {
        
        blankBlock -= 1
        button6.isHidden = true
        
        if playerMark == "O" {
            blockImageView6.image = UIImage(named: "circle")
            block[5] = 1
            
            if block[5] == block[2] && block[5] == block[8] ||  block[5] == block[4] && block[5] == block[3] {
                
                oWin()

            } else {
                displayTie()

            }
            playerMark = "X"
            turnLabel.text = "It's X's turn"



        } else {
            blockImageView6.image = UIImage(named: "xmark")
            block[5] = 2
            
            if block[5] == block[2] && block[5] == block[8] ||  block[5] == block[4] && block[5] == block[3] {
                
                xWin()

            } else {
                displayTie()

            }
            playerMark = "O"
            turnLabel.text = "It's O's turn."

        }
    
    }
    
    //玩家在第七個格子上標記的按鈕
    @IBAction func mark7(_ sender: Any) {
        
        blankBlock -= 1
        button7.isHidden = true
        
        if playerMark == "O" {
            blockImageView7.image = UIImage(named: "circle")
            block[6] = 1
            
            if block[6] == block[0] && block[6] == block[3] || block[6] == block[4] && block[6] == block[2] || block[6] == block[7] && block[6] == block[8] {
                oWin()

            } else {
                displayTie()

            }
            playerMark = "X"
            turnLabel.text = "It's X's turn"


        } else {
            blockImageView7.image = UIImage(named: "xmark")
            block[6] = 2
            if block[6] == block[0] && block[6] == block[3] || block[6] == block[4] && block[6] == block[2] || block[6] == block[7] && block[6] == block[8] {
                xWin()
            } else {
                displayTie()

            }
            playerMark = "O"
            turnLabel.text = "It's O's turn."

        }
  
    }
    
    //玩家在第八個格子上標記的按鈕
    @IBAction func mark8(_ sender: Any) {
        blankBlock -= 1
        button8.isHidden = true
        if playerMark == "O" {
            blockImageView8.image = UIImage(named: "circle")
            block[7] = 1
            
            if block[7] == block[4] && block[7] == block[1] || block[7] == block[6] && block[7] == block[8] {
                oWin()
            } else {
                displayTie()

            }
            playerMark = "X"
            turnLabel.text = "It's X's turn"



        } else {
            blockImageView8.image = UIImage(named: "xmark")
            block[7] = 2
            if block[7] == block[4] && block[7] == block[1] || block[7] == block[6] && block[7] == block[8] {
                
                xWin()
            } else {
                displayTie()

            }
            playerMark = "O"
            turnLabel.text = "It's O's turn."

        }
   
    }
    
    //玩家在第九個格子上標記的按鈕
    @IBAction func mark9(_ sender: Any) {
        
        blankBlock -= 1
        button9.isHidden = true

        if playerMark == "O" {
            blockImageView9.image = UIImage(named: "circle")
            block[8] = 1
            
            if block[8] == block[0] && block[8] == block[4] || block[8] == block[2] && block[8] == block[5] || block[8] == block[6] && block[8] == block[7]{
               oWin()

            } else {
            
                displayTie()

            }
            playerMark = "X"
            turnLabel.text = "It's X's turn"


        } else {
            blockImageView9.image = UIImage(named: "xmark")
            block[8] = 2
            
            if block[8] == block[0] && block[8] == block[4] || block[8] == block[2] && block[8] == block[5] || block[8] == block[6] && block[8] == block[7]{
                xWin()

            } else {
                displayTie()
            }
            playerMark = "O"
            turnLabel.text = "It's O's turn."

        }
     
    }
    
    //清除所有標記的方法
    func clearAllImages() {
        blockImageView1.image = UIImage(named: "")
        blockImageView2.image = UIImage(named: "")
        blockImageView3.image = UIImage(named: "")
        blockImageView4.image = UIImage(named: "")
        blockImageView5.image = UIImage(named: "")
        blockImageView6.image = UIImage(named: "")
        blockImageView7.image = UIImage(named: "")
        blockImageView8.image = UIImage(named: "")
        blockImageView9.image = UIImage(named: "")
        
    }
    
    //顯示所有格子按鈕的方法
    func showAllButtons(){
        
        button1.isHidden = false
        button2.isHidden = false
        button3.isHidden = false
        button4.isHidden = false
        button5.isHidden = false
        button6.isHidden = false
        button7.isHidden = false
        button8.isHidden = false
        button9.isHidden = false
        
    }
    
    //再多一回合的按鈕
    @IBAction func oneMoreRound(_ sender: Any) {
        
        showAllButtons()
        
        clearAllImages()
        
        winnerView.isHidden = true

        turnLabel.isHidden = false
        winLabel.text = ""
        block = [0,0,0,0,0,0,0,0,0]
        blankBlock = 9
    }
    
    //重新遊戲的按鈕
    @IBAction func restart(_ sender: Any) {
        
        circleScoreLabel.text = "0"
        crossScoreLabel.text = "0"
        
        showAllButtons()
        clearAllImages()
        
        if playerMark == "O" {
            turnLabel.text = "It's O's turn."
        } else {
            turnLabel.text = "Its X's turn."
        }
        
        winnerView.isHidden = true
        block = [0,0,0,0,0,0,0,0,0]
        blankBlock = 9
        
        xScore = 0
        oScore = 0
    }
   
}
