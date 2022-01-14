import UIKit

class _A2BViewController: UIViewController {
    
    
    // guess view
    
    @IBOutlet weak var guessTextField: UITextField!
    
    @IBOutlet weak var guessWarningLabel: UILabel!
    
    
    @IBOutlet weak var resultTextView: UITextView!
    
    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var guessButton: UIButton!
    
    @IBOutlet weak var hintButton: UIButton!
    
    @IBOutlet weak var showAnswerButton: UIButton!
    
    
    //enter view
    
    @IBOutlet weak var enterView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var fourNumbersTextField: UITextField!
    
    @IBOutlet weak var fourNumsWarningLabel: UILabel!
    //

    
    var answer = [String.Element]()
    
    var guess = [String.Element]()
    
    var pressTimes = 0
    
    var getHints = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playAgainButton.isHidden = true
        hintButton.isHidden = true
        showAnswerButton.isHidden = true
        resultTextView.isHidden = true
       
    }
    
    @IBAction func startGame(_ sender: Any) {
        
        guessTextField.isHidden = false
        
        guessButton.isHidden = false
       
        if let fourNumsText = fourNumbersTextField.text {
            
           
            if checkFourNums(nums: fourNumsText) {
                
                enterView.isHidden = true
                
                answer = Array(fourNumsText)
                
                fourNumsWarningLabel.text = ""
                
            } else {
                
                fourNumsWarningLabel.text = "Please enter FOUR DIFFERENT numbers!"
                
                fourNumbersTextField.text = ""
            }
        }
        view.endEditing(true)
    }
    
    
    func checkFourNums(nums: String) -> Bool {
        
        let array = Array(nums)
        let set = Set(nums)
        
        if array.count == 4 && set.count == 4 {
            
            return true
            
        } else {
            
        
            return false
        }
        
        
    }
    
    
    @IBAction func playAgain(_ sender: Any) {
        
        playAgainButton.isHidden = true
        
        resultTextView.text = ""
        
        enterView.isHidden = false
        
        fourNumbersTextField.text = ""
        
        guessTextField.text = ""
        
        winLabel.text = ""
        
        view.endEditing(true)
        
        resultTextView.isHidden = true
        
        pressTimes = 0
        
        getHints = 0
    }
    
    
    @IBAction func hint(_ sender: UIButton) {
        
        let randomInt = Int.random(in: 0...3)
        
        switch randomInt {
            
        case 0:
            resultTextView.text += "\(answer[0])***\n"
            
        case 1:
            resultTextView.text += "*\(answer[1])** \n"

        case 2:
            resultTextView.text += "**\(answer[2])* \n"

        default:
            resultTextView.text += "***\(answer[3]) \n"

        }
        
        getHints += 1
        
        view.endEditing(true)
    }
    
    
    @IBAction func showAnswer(_ sender: UIButton) {
        
        resultTextView.text += "The numbers are " + fourNumbersTextField.text! + "\n"
        
        showAnswerButton.isHidden = true
        hintButton.isHidden = true
        guessButton.isHidden = true
        
        playAgainButton.isHidden = false
        
        view.endEditing(true)
    }
    
    
    @IBAction func guessNums(_ sender: UIButton) {
        
        var A = 0
        var B = 0
        
        if let fourNums = guessTextField.text {
            
           
            guessWarningLabel.text = ""
            
            guess = Array(fourNums)
            
            if checkFourNums(nums: fourNums) {
                
                resultTextView.isHidden = false
                
                for i in 0...3 {
                    
                    if answer[i]==guess[i] {
                        
                        A += 1
                        
                    } else if answer.contains(guess[i]) {
                        
                        B += 1
                        
                       
                    }
                    
                }
                
                resultTextView.text += "\(String(describing: guessTextField.text!)): \(A)A\(B)B \n"
                
                
                pressTimes += 1
                
                if pressTimes == 3 {
                    
                    hintButton.isHidden = false
                    showAnswerButton.isHidden = false
                    
                }
                
                
                if A == 4 {
                    
                    winLabel.text = "Congradulations! :)"
                    
                    playAgainButton.isHidden = false
                    
                    guessButton.isHidden = true
                    
                    guessTextField.isHidden = true
                    
                    showAnswerButton.isHidden = true
                    
                    hintButton.isHidden = true
                    
                    resultTextView.text += ("You guessed \(pressTimes) " + (pressTimes == 1 ? "time \n" : "times \n"))
                    
                    if getHints == 0 {
                        
                        resultTextView.text += "You didn't use any hints! Well Done! \n"
                        
                    } else if getHints == 1 {
                        
                        resultTextView.text += "You used one hint. \n"
                        
                    } else {
                        
                        resultTextView.text += "You used \(getHints) hints \n"
                    }
                }
               
                guessTextField.text = ""
                
                
            } else {
                
                guessWarningLabel.text = "Please enter FOUR DIFFERENT numbers!"
                
                guessTextField.text = ""
            }
            
            
         
           
        }
        
        
        
        view.endEditing(true)
    }
    
}
