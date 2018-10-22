//
//  ViewController.swift
//  Quizz_Geek_Swift
//
//  Created by TA Trung Thanh on 21/10/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

import UIKit

typealias Q_a_A = (Bool, String, String, Bool)

class QuestionAndAnswer: NSObject {
    //create a set of tuple
    private var Q_and_A = [(false, "Who is the father of the atomic bomb?", "Robert Oppenheimer", false),
                           (false, "What is the meaning of life?", "The meaning of life is 42.", false),
                           (false, "Who was the first man to fly around the earth with a spaceship?", "Gagarin", false),
                           (true, "On which hemisphere were the most dinosaur skeletons found?", "The northern hemisphere", false),
                           (true, "What color is cobalt?", "Blue", false),
                           (true, "What is the organ that is affected when one is suffering from hepatitis?", "Liver", false),
                           (false, "Which device do we use to look at the stars?", "Telescope", false),
                           (true, "Which unit indicates the light intensity?", "Candela", false),
                           (false, "What are the three primary colors?", "Blue, yellow and red", false),
                           (false, "Which planet is nearest the sun?", "Mercury", false),
                           (true, "Who discoved one of the first antibiotics: penicillin ?", "Alexander Fleming", false),
                           (false, "What is the substance known by the chemical formula NH3?", "Ammoniac", false),
                           (false, "What is the lightest existing metal?", "Aluminium", false),
                           (false, "Who was the inventor of the steam engine?", "James Watt", false),
                           (true, "Two brothers invented the hot air balloon. What was their surname?", "Montgolfier", false),
                           (true, "What are the three primary colors?", "Blue, yellow and red", false),
                           (false, "Who was the first American in space?", "Alan Shepard", false)]
    
    func getSize () -> Int{
        return Q_and_A.count
    }
    
    func getQandA (target : Int) -> Q_a_A{
        return Q_and_A[target]
    }
    
    func setQandA (target : Int , val : Bool) -> Void{
        Q_and_A[target].3 = val
    }
    
}


class ViewController: UIViewController {
    var myQandA = QuestionAndAnswer()
    var cpt : Int = 0
    var cpt_answer : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let v = MyRotatingView(frame: UIScreen.main.bounds)
        self.view = v
        v.backgroundColor = UIColor.white
        displayQandA()
    }
    
    func displayQandA() {
        let v = self.view as! MyRotatingView //avoiding an error
        if (myQandA.getQandA(target: cpt).0){ //hard question
            v.textViewQuetion.textColor = UIColor.red
        } else {
            v.textViewQuetion.textColor = UIColor.black
        }
        v.textViewQuetion.text = myQandA.getQandA(target: cpt).1
        if (myQandA.getQandA(target: cpt).3){ //already use help
            v.textViewAnswer.text = myQandA.getQandA(target: cpt).2
        } else {
            v.textViewAnswer.text = ""
        }
        v.labelAnswerSeenNumber.text = String(cpt_answer)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        let v = self.view as! MyRotatingView //avoiding an error
        v.drawInFormat(format: size) //Implement by MyRotatingView
    }

    @objc func actionButtonGetAnswertouched (sender: UIButton!) {
        print("get answer")
        if (!myQandA.getQandA(target: cpt).3){
            myQandA.setQandA(target: cpt, val: true)
            cpt_answer += 1
            displayQandA()
        }
        
    }
    
    @objc func actionButtonLefttouched (sender: UIButton!) {
        let v = self.view as! MyRotatingView //avoiding an error
        print("Left")
        if (cpt > 0){
            cpt -= 1
            if (v.switchChuck.isOn){
                displayQandA()
            } else { //jump to the next easy quetion
                while (myQandA.getQandA(target: cpt).0 && cpt > 0){
                    cpt -= 1
                }
                displayQandA()
            }
        }
    }
    
    @objc func actionButtonRighttouched (sender: UIButton!) {
        let v = self.view as! MyRotatingView //avoiding an error
        print("Right")
        if (cpt < myQandA.getSize() - 1){
            cpt += 1
            if (v.switchChuck.isOn){ //display hard question
                displayQandA()
            } else { //skip hard question, jump to the next easy quetion
                while (myQandA.getQandA(target: cpt).0 && cpt < myQandA.getSize() - 1){
                    cpt += 1
                }
                displayQandA()
            }
        }
    }
}

