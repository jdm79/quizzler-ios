//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // initialises a new QuestionBank object
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            
            pickedAnswer = true
            
        } else {
            
            pickedAnswer = false
            
        }
        
        checkAnswer()
        
        // moves the game onto the next question by increasing the index number for the list array
        questionNumber += 1
       
        
        nextQuestion()
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        
        progressLabel.text = "\(questionNumber + 1) / 13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
        
    }
    

    func nextQuestion() {
        
        if questionNumber < allQuestions.list.count {

            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            updateUI()

        
        } else {
            

            let alert = UIAlertController(title: "Awesome!", message: "You scored \(score)! Do you want to try again", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:
                { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
        }

    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            
            ProgressHUD.showSuccess("Correct!")
            
            score += 1
            
        } else {
            
            ProgressHUD.showError("Wrong!")

        }
        
    }
    
    
    func startOver() {
        
        questionNumber = 0
        
        score = 0
        
        nextQuestion()
        
    }
    

    
}
