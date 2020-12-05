//
//  QuestionViewController.swift
//  JU Quize
//
//  Created by Peyman Osatian on 2020-11-07.
//  Copyright © 2020 Peyman Osatian. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var buttonAnswerD: UIButton!
    @IBOutlet weak var buttonAnswerC: UIButton!
    @IBOutlet weak var butoonAnswerB: UIButton!
    @IBOutlet weak var buttonAnswerA: UIButton!
    
    
    private var haveWon = false
    var questions: [Question] = [] {
        didSet {
            question = questions.removeFirst()
        }
    }
    var question : Question?
    var numberOfQuestions = 0
    var rightAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.clipsToBounds = true
        questionLabel.layer.cornerRadius = 20
        var buttons = [buttonAnswerA, butoonAnswerB, buttonAnswerC, buttonAnswerD]
        buttons.forEach{(button) in
            button?.layer.cornerRadius = 20
        }
        
        questionLabel.text = question?.question
        buttons.shuffle()
        let correctButton = buttons.removeFirst()
        correctButton?.setTitle(question?.correctAnswer, for : .normal)
        
        question?.incorrectAnswers.forEach({ (answer) in
            let button = buttons.removeFirst()
            button?.setTitle(answer,for: .normal)
            })
    }
    

    @IBAction func buttonAnswerAHandler(_ sender: Any) {
        if buttonAnswerA.title(for : .normal) == question?.correctAnswer{
          showRightAnswerAlert(button: buttonAnswerA)
        }else{
          showWrongAnswerAlert(button: buttonAnswerA)
        }
    }
    
    @IBAction func buttonAnswerBHandler(_ sender: Any) {
        if butoonAnswerB.title(for : .normal) == question?.correctAnswer{
          showRightAnswerAlert(button: butoonAnswerB)
        }else{
          showWrongAnswerAlert(button: butoonAnswerB)
        }
    }
    
    @IBAction func buttonAnswerCHandler(_ sender: Any) {
        if buttonAnswerC.title(for : .normal) == question?.correctAnswer{
          showRightAnswerAlert(button: buttonAnswerC)
        }else{
          showWrongAnswerAlert(button: buttonAnswerC)
        }
    }
    
    @IBAction func buttonAnswerDHandler(_ sender: Any) {
        if buttonAnswerD.title(for : .normal) == question?.correctAnswer{
          showRightAnswerAlert(button: buttonAnswerD)
        }else{
          showWrongAnswerAlert(button: buttonAnswerD)
        }

    }
    
    private func showWrongAnswerAlert(button:UIButton){
        haveWon = false
        button.backgroundColor = .red
        let alertController = UIAlertController (title:"WRONG😳", message : "maybe next time ..", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "oh no ...", style : UIAlertAction.Style.default, handler: { [weak self] (_) in
            self?.goToNextScreen()
        }))
        present(alertController, animated: true,completion:nil)
    }
    
    private func showRightAnswerAlert(button:UIButton){
        haveWon = true
        rightAnswers += 1
        button.backgroundColor = .green
        let alertController = UIAlertController (title:"FISH", message : "YEAAAAAAAA It's correct", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "YES", style : UIAlertAction.Style.default, handler: { [weak self] (_) in
            self?.goToNextScreen()
        }))
        present(alertController, animated: true,completion:nil)
    }
    
    private func goToNextScreen() {
        guard questions.isEmpty == false,
                let questionViewController = storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController else {
            performSegue(withIdentifier: "ResultView", sender: nil)
            return

        }
        questionViewController.numberOfQuestions = numberOfQuestions
        questionViewController.rightAnswers = rightAnswers
        questionViewController.questions = questions
        navigationController?.pushViewController(questionViewController, animated: true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultViewController = segue.destination as? ResultViewController {
            resultViewController.resultView.resultLabel.text = "🤩 You answered \(rightAnswers) right from \(numberOfQuestions) Questions"
        }
    }

}
