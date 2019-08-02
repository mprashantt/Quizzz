//
//  ViewController.swift
//  Quizzz
//
//  Created by Prashant Tripathi on 02/08/19.
//  Copyright © 2019 Prashant Tripathi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let allQuestion = QuestionCollection()
    var selectedAns : String = ""
    var questionNum : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var newQuestion: UILabel!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if sender.tag == 1
        {
            selectedAns = "1";
        }
        else if sender.tag == 2
        {
            selectedAns = "2";
        }
        else if sender.tag == 3
        {
            selectedAns = "3";
        }
        else{
            selectedAns = "4";
        }
        checkAnswer()
        
        questionNum = questionNum + 1
        nextQuestion()
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score : \(score)"
        questionNumber.text = "\(questionNum+1)/10"
        
        
        
    }
    
    
    func nextQuestion() {
        
        if questionNum <= 9 {
            newQuestion.text = allQuestion.list[questionNum].getQuestion()
            var button:UIButton=UIButton()
            for i in 1...4
            {
                button=view.viewWithTag(i) as! UIButton
                button.setTitle(allQuestion.list[questionNum].getChoice(index: i-1), for: .normal)
            }
            updateUI()
            
        } else {
            let alert = UIAlertController(title: "Great", message: "want to start again ..?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIActionAlert) in
                self.startOver()
            })
            
            
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
        
        
        
    }
    
    
    func checkAnswer() {
        let correctAns = allQuestion.list[questionNum].getAnswer()
        if correctAns == selectedAns {
            ProgressHUD.showSuccess("Correct")
            score += 1
        } else {
            
            ProgressHUD.showError("Wrong!")
            
        }
        
    }
    
    
    func startOver() {
        
        questionNum = 0
        score = 0
        nextQuestion()
        
    }
    

    
}

