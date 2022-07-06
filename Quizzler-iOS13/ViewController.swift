//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
        ["Four + Two is equal to Six", "True"],
        ["Five - Three is greater than One", "True"],
        ["Three + Two is less than Ten", "True"]
    ]
    
    let anotherQuiz = [
        "Four + Two is equal to Six": "True",
        "Five - Three is greater than One": "True",
        "Three + Two is less than Ten": "True"
    ]
    
    lazy var arrayQuiz: [String] = {
        anotherQuiz.keys.sorted()
    }()
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle // True, False
//        let actualAnswer = quiz[questionNumber][1]
        let question = arrayQuiz[questionNumber]
        
        guard let actualAnswer = anotherQuiz[question] else {
            return
        }
        
        if userAnswer == actualAnswer {
            print("Right!")
        } else {
            print("Wrong!")
        }
        
        if questionNumber != quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        updateUI()
    }
    
    func updateUI() {
//        questionLabel.text = quiz[questionNumber][0]
        questionLabel.text = arrayQuiz[questionNumber]
    }
}

