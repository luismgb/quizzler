//
//  ViewController.swift
//  Quizzler
//
//  Created by Luis M Gonzalez on 12/19/17.
//  Copyright © 2017 Luis M Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionIndex: Int = 0
    var questionNumber: Int {
        return questionIndex + 1
    }
    var score: Int = 0
    var numberOfQuestions: Int {
        return allQuestions.list.count
    }
    
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
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionIndex += 1
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionIndex + 1)/\(numberOfQuestions)"
        
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(numberOfQuestions)) * CGFloat(questionNumber)
    }
    
    
    func nextQuestion() {
        if questionNumber <= numberOfQuestions {
            questionLabel.text = allQuestions.list[questionIndex].questionText
            updateUI()
        } else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionIndex].answer
        
        if correctAnswer == pickedAnswer {
            print("You got it right!")
            score += 1
        } else {
            print("WRONG")
        }
    }
    
    
    func startOver() {
        questionIndex = 0
        score = 0
        nextQuestion()
        updateUI()
    }
    
}
