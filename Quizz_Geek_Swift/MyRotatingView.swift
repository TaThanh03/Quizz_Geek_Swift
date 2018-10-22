//
//  MyRotatingView.swift
//  Quizz_Geek_Swift
//
//  Created by TA Trung Thanh on 21/10/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

import UIKit

class MyRotatingView: UIView {
    let buttonLeft = UIButton(type: .custom)
    let buttonRight = UIButton(type: .custom)
    
    let buttonGetAnswer = UIButton(type: .system)
    let labelQuestion : UILabel = UILabel()
    let textViewQuetion : UITextView = UITextView()
    let labelAnswer : UILabel = UILabel()
    let textViewAnswer : UITextView = UITextView()
    let labelAnswerSeen : UILabel = UILabel()
    let labelAnswerSeenNumber : UILabel = UILabel()
    let labelChuckNorris : UILabel = UILabel()
    let switchChuck : UISwitch = UISwitch()
    
    
    override init(frame: CGRect) {
        buttonLeft.setImage(UIImage(named: "Left"), for: .normal)
        buttonRight.setImage(UIImage(named: "Right"), for: .normal)
        buttonGetAnswer.setTitle("Get answer", for: .normal)
        labelQuestion.text = "Quetion"
        labelAnswer.text = "Answer"
        labelAnswerSeen.text = "Answer seen:"
        labelAnswerSeenNumber.text = "0"
        labelChuckNorris.text = "Chuck"
        
        labelQuestion.textAlignment = NSTextAlignment.center
        labelAnswer.textAlignment = NSTextAlignment.center
        textViewQuetion.textAlignment = NSTextAlignment.center
        textViewAnswer.textAlignment = NSTextAlignment.center
        
        
        super.init(frame: frame); //you need self to be setup now
        self.addSubview(buttonLeft)
        self.addSubview(buttonRight)
        self.addSubview(buttonGetAnswer)
        
        self.addSubview(labelQuestion)
        self.addSubview(textViewQuetion)
        self.addSubview(labelAnswer)
        self.addSubview(textViewAnswer)
        
        self.addSubview(labelAnswerSeen)
        self.addSubview(labelAnswerSeenNumber)
        self.addSubview(labelChuckNorris)
        
        self.addSubview(switchChuck)
        
        buttonGetAnswer.addTarget(self.superview, action: #selector(ViewController.actionButtonGetAnswertouched), for: .touchUpInside)
        buttonLeft.addTarget(self.superview, action: #selector(ViewController.actionButtonLefttouched), for: .touchUpInside)
        buttonRight.addTarget(self.superview, action: #selector(ViewController.actionButtonRighttouched), for: .touchUpInside)
        
        
        self.drawInFormat(format: frame.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder :) has not been implemented")
    }
    
    func drawInFormat (format: CGSize) {
        let border_head : CGFloat
        let border_bottom : CGFloat
        let border_side_left : CGFloat
        let border_side_right : CGFloat
        let centre : CGFloat
        let outlet_width : CGFloat
        let outlet_height : CGFloat
        let button_width : CGFloat
        let button_height : CGFloat
        let textView_height : CGFloat
        
        if (format.height <  540.0 ) { //landscape mode
            border_head = CGFloat(10)
            border_bottom = CGFloat(format.height - 60.0)
            border_side_left = CGFloat(format.width/15.0)
            border_side_right = CGFloat(format.width - border_side_left)
            centre = CGFloat(format.width/2)
            outlet_width = CGFloat(format.width - border_side_left*2)
            outlet_height = CGFloat(30.0)
            button_width = CGFloat(format.width/5 * 0.7)
            button_height = CGFloat(format.width/5 * 0.5)
            textView_height = CGFloat(format.height/6)
            
        } else { //big screen of portrait
            border_head = CGFloat(40.0)
            border_bottom = CGFloat(format.height-50.0)
            border_side_left = CGFloat(format.width/12.0)
            border_side_right = CGFloat(format.width - border_side_left)
            centre = CGFloat(format.width/2)
            outlet_width = CGFloat(format.width - border_side_left*2)
            outlet_height = CGFloat(30.0)
            button_width = CGFloat(format.width/3 * 0.6)
            button_height = CGFloat(format.width/3 * 0.4)
            textView_height = CGFloat(format.height/4)
        }
        
        print("w %f", format.width)
        print("h %f", format.height)
        
        buttonLeft.frame            = CGRect(x: border_side_left, y: border_head, width: button_width, height: button_height)
        buttonRight.frame           = CGRect(x: border_side_right - button_width, y: border_head, width: button_width, height: button_height)
        buttonGetAnswer.frame       = CGRect(x: centre - button_width*1.5/2, y: border_head, width: button_width*1.5, height: button_height)
        labelQuestion.frame         = CGRect(x: border_side_left, y: border_head + button_height, width: outlet_width, height: outlet_height)
        textViewQuetion.frame       = CGRect(x: border_side_left, y: border_head + button_height + outlet_height, width: outlet_width, height: textView_height)
        labelAnswer.frame           = CGRect(x: border_side_left, y: border_head + button_height + outlet_height + textView_height, width: outlet_width, height: outlet_height)
        textViewAnswer.frame        = CGRect(x: border_side_left, y: border_head + button_height + 2*outlet_height + textView_height, width: outlet_width, height: textView_height)
        labelAnswerSeen.frame       = CGRect(x: border_side_left, y: border_bottom, width: button_width + 40, height: button_height)
        labelAnswerSeenNumber.frame = CGRect(x: border_side_left + 40 + button_width, y: border_bottom, width: button_width, height: button_height)
        labelChuckNorris.frame      = CGRect(x: border_side_right - 2*button_width, y: border_bottom, width: button_width, height: button_height)
        switchChuck.frame           = CGRect(x: border_side_right - button_width, y: border_bottom, width: button_width, height: button_height)
    }
}
