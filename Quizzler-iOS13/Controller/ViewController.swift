//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // Answer!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2,
                             target: self,
                             selector: #selector(updateUI),
                             userInfo: nil,
                             repeats: false)
    }
    
    @objc func updateUI() {
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()
        
        let answerOne = quizBrain.getAnswers()[0]   // Possible Answer #1
        let answerTwo = quizBrain.getAnswers()[1]   // Possible Answer #2
        let answerThree = quizBrain.getAnswers()[2] // Possible Answer #3
        
        choiceOneButton.setTitle(answerOne, for: .normal)
        choiceTwoButton.setTitle(answerTwo, for: .normal)
        choiceThreeButton.setTitle(answerThree, for: .normal)
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        choiceOneButton.backgroundColor = .clear
        choiceTwoButton.backgroundColor = .clear
        choiceThreeButton.backgroundColor = .clear
    }
}
