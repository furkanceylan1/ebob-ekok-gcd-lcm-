//
//  ViewController.swift
//  Ebob-Ekok
//
//  Created by Furkan Ceylan on 12.05.2022.
//

import UIKit

class ViewController: UIViewController {

    let (firstNumber,secondNumber,colorTextField) = (UITextField(),UITextField(),UITextField())
    let (ebobButton,ekokButton,colorButton) = (UIButton(),UIButton(),UIButton())
    let resultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.view.backgroundColor = UIColor(red: 232/256, green: 249/256, blue: 253/256, alpha: 0.8) // View Background
        textField(placeholder: "Please Enter First Number", x: width * 0.1, y: height * 0.1, width: width * 0.8, height: 34, numberName: firstNumber)
        textField(placeholder: "Please Enter Second Number", x: width * 0.1, y: height * 0.1 + 44 , width: width * 0.8, height: 34, numberName: secondNumber)
        
        myButton(setTitle: "Ekok", type: .normal, titleColor: .blue, x: width * 0.1, y: height * 0.1 + 84, width: width * 0.3, height: 30, red: 121/256, green: 218/256, blue: 232/256, alpha: 1, buttonName: ekokButton, calc: #selector(ekok))
        myButton(setTitle: "Ebob", type: .normal, titleColor: .red, x: width * 0.6, y: height * 0.1 + 84, width: width * 0.3, height: 30, red: 121/256, green: 218/256, blue: 232/256, alpha: 1, buttonName: ebobButton, calc: #selector(ebob))
        
        resultLabel.text = "Result = "
        resultLabel.textAlignment = NSTextAlignment.center
        resultLabel.frame = CGRect(x: width * 0.5 - width * 0.4, y: height * 0.5, width: width * 0.8, height: 30)
        resultLabel.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0)
        view.addSubview(resultLabel)
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @objc func textField(placeholder : String,x : CGFloat, y : CGFloat, width : CGFloat, height : CGFloat, numberName : UITextField){
        numberName.placeholder = "\(placeholder)"
        numberName.textAlignment = NSTextAlignment.center
        numberName.frame = CGRect(x: x, y: y, width: width, height: height)
        numberName.backgroundColor = UIColor .white
        numberName.keyboardType = UIKeyboardType.numberPad
        numberName.textColor = UIColor.black
        self.view.addSubview(numberName)
    }
    
    @objc func myButton(setTitle : String, type : UIControl.State, titleColor : UIColor, x : CGFloat, y : CGFloat, width : CGFloat, height : CGFloat, red : CGFloat, green : CGFloat, blue : CGFloat, alpha : CGFloat, buttonName : UIButton, calc : Selector){
        
        buttonName.setTitle(setTitle, for : type)
        buttonName.setTitleColor(titleColor, for: type)
        buttonName.frame = CGRect(x: x, y: y, width: width, height: height)
        buttonName.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        buttonName.addTarget(self, action: calc, for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonName)
        
    }
    
    func gcd(_ x: Int, _ y: Int) -> Int {
        
        var a = 0
        var b = max(x, y)
        var r = min(x, y)
        
        while r != 0 {
            a = b
            b = r
            r = a % b
        }
        return b
    }

    func lcm(_ x: Int, _ y: Int) -> Int {
        return x / gcd(x, y) * y
    }

    @objc func ekok(){
        
        let ek = lcm(Int(firstNumber.text!)!, Int(secondNumber.text!)!)
        resultLabel.text = "Result = \(ek)"
        
    }
    
    @objc func ebob(){
        let eb = gcd(Int(firstNumber.text!)!, Int(secondNumber.text!)!)
        resultLabel.text = "Result = \(eb)"
    }

}

