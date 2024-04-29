//
//  ViewController.swift
//  calculator
//
//  Created by Students on 22/04/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var calculatorworking: UILabel!
    
    @IBOutlet weak var caculatorresult: UILabel!
    var workings:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearall()
    }
    
    func clearall() {
        workings = ""
        calculatorworking.text = ""
        caculatorresult.text = ""
        
    }
    
    @IBAction func equaltap(_ sender: Any) {
        if(validInput())
                   {
                       let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
                       let expression = NSExpression(format: checkedWorkingsForPercent)
                       let result = expression.expressionValue(with: nil, context: nil) as! Double
                       let resultString = formatResult(result: result)
                       caculatorresult.text = resultString
                   }
                   else
                   {
                       let alert = UIAlertController(
                           title: "Invalid Input",
                           message: "Calculator unable to do math based on input",
                           preferredStyle: .alert)
                       alert.addAction(UIAlertAction(title: "Okay", style: .default))
                       self.present(alert, animated: true, completion: nil)
                   }
    }
    
    func validInput() ->Bool
            {
                var count = 0
                var funcCharIndexes = [Int]()
                
                for char in workings
                {
                    if(specialCharacter(char: char))
                    {
                        funcCharIndexes.append(count)
                    }
                    count += 1
                }
                
                var previous: Int = -1
                
                for index in funcCharIndexes
                {
                    if(index == 0)
                    {
                        return false
                    }
                    
                    if(index == workings.count - 1)
                    {
                        return false
                    }
                    
                    if (previous != -1)
                    {
                        if(index - previous == 1)
                        {
                            return false
                        }
                    }
                    previous = index
                }
                
                return true
            }
            
            func specialCharacter (char: Character) -> Bool
            {
                if(char == "*")
                {
                    return true
                }
                if(char == "/")
                {
                    return true
                }
                if(char == "+")
                {
                    return true
                }
                return false
            }
            
            func formatResult(result: Double) -> String
            {
                if(result.truncatingRemainder(dividingBy: 1) == 0)
                {
                    return String(format: "%.0f", result)
                }
                else
                {
                    return String(format: "%.2f", result)
                }
            }
            
    
    @IBAction func allclear(_ sender: Any) {
        clearall()
    }
    
    @IBAction func backtap(_ sender: Any) {
        if (!workings.isEmpty){
            workings.removeLast()
            calculatorworking.text = workings
        }
    }
    
    func addwork(value: String){
        workings = workings + value
        calculatorworking.text = workings
    }
    @IBAction func percentagetap(_ sender: Any) {
        addwork(value: "%")
    }
    
    @IBAction func dividetap(_ sender: Any) {
        addwork(value: "/")
    }
    
    @IBAction func multitap(_ sender: Any) {
        addwork(value: "*")
    }
    
    @IBAction func minustap(_ sender: Any) {
        addwork(value: "-")
    }
    
    @IBAction func plustap(_ sender: Any) {
        addwork(value: "+")
    }
    
    @IBAction func zerotap(_ sender: Any) {
        addwork(value: "0")
    }
    
    @IBAction func decimaltap(_ sender: Any) {
        addwork(value: "/")
    }
    
    @IBAction func ninetap(_ sender: Any) {
        addwork(value: "9")
    }
    
    @IBAction func eighttap(_ sender: Any) {
        addwork(value: "8")
    }
    
    @IBAction func seventap(_ sender: Any) {
        addwork(value: "7")
    }
    
    @IBAction func sixtap(_ sender: Any) {
        addwork(value: "6")
    }
    
    @IBAction func fivetap(_ sender: Any) {
        addwork(value: "5")
    }
    
    @IBAction func fourtap(_ sender: Any) {
        addwork(value: "4")
    }
    
    @IBAction func threetap(_ sender: Any) {
        addwork(value: "3")
    }
    
    @IBAction func twotap(_ sender: Any) {
        addwork(value: "2")
    }
    
    @IBAction func onetap(_ sender: Any) {
        addwork(value: "1")
    }
    
    
}

