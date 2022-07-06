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
    
    let question = (text: "Four + Two is equal to Six",
                    answer: "True")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        questionLabel.text = question.text
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if let answer = sender.currentTitle {
            
            if answer == question.answer {
                questionLabel.text = question.answer
            } else {
                questionLabel.text = "Mistaken"
            }
        }
    }
}

