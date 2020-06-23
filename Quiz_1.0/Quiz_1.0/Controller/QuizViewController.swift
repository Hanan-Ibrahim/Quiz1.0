//
//  QuizViewController.swift
//  Quiz_1.0
//
//  Created by Hanoudi on 6/22/20.
//  Copyright © 2020 Hanan. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    //  MARK:- Outlets.
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!

    //  MARK:- Variable: Cerebrum of Quiz App.
    var quizMind = QuizMind()
    

    //  MARK:- Function/s
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        // check whether title is true or false.
        let answer = sender.currentTitle!
        
        // compare selected answer with correct answer.
        let userGotItCorrect = quizMind.checkAnswer(userAnswer: answer)
        
        // if correct, color button as green; else as red
        if userGotItCorrect {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        // move to next queston. i.e current question number updated
        quizMind.nextQuestion()
        
        // wait for  0.2 s -> return button colors to clear, display next question and update score.
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    //  MARK:- UI functions
    @objc func updateUI() {
        // depending on current queston number display new question.
        questionLabel.text = quizMind.getQuestion()
        // update progress.
        progressBar.progress = quizMind.getProgress()
        // update score.
        scoreLabel.text = "Score: \(quizMind.getScore())"
        
        // return actual colors of buttons.
        trueButton.backgroundColor  = .clear
        falseButton.backgroundColor = .clear
        
    
    }

    //  MARK:- Life Cycle of view.
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @objc func displayAlert(){
    let alert = UIAlertController(title: "End of quiz.", message: "You scored \(quizMind.score) out of \(quizMind.quiz.count)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }

}

