//
//  QuestionViewController.swift
//  JuQuize
//
//  Created by Mahsa  on 2020-12-02.
//  Copyright © 2020 com.mahsa. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var buttonAnswerA: UIButton!
    @IBOutlet weak var butoonAnswerB: UIButton!
    @IBOutlet weak var buttonAnswerC: UIButton!
    @IBOutlet weak var buttonAnswerD: UIButton!
    
    private let gameResultDatabaseManager = GameResultDatabaseManager()
    private var haveWon = false
    //question is coming from startviewController for asking questions
    var questions: [Question] = [] {
        didSet {
            question = questions.removeFirst()
        }
    }
    var question : Question?
    var numberOfQuestions = 0
    var rightAnswers = 0
    //buttons configure
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        questionLabel.clipsToBounds = true
        questionLabel.layer.cornerRadius = 20
        var buttons = [buttonAnswerA, butoonAnswerB, buttonAnswerC, buttonAnswerD]
        buttons.forEach{(button) in
            button?.layer.cornerRadius = 20
        }
        //html decode lables for questions and answers
        questionLabel.text = question?.question.htmlDecoded
        buttons.shuffle()
        let correctButton = buttons.removeFirst()
        correctButton?.setTitle(question?.correctAnswer.htmlDecoded, for : .normal)
        
        question?.incorrectAnswers.forEach({ (answer) in
            let button = buttons.removeFirst()
            button?.setTitle(answer.htmlDecoded,for: .normal)
            })
    }
    
  //answers alert (status) next question
    @IBAction func buttonAnswerAHandler(_ sender: Any) {
        if checkIfItIsTheRightAnswer(forButton: buttonAnswerA){
          showRightAnswerAlert(button: buttonAnswerA)
        }else{
          showWrongAnswerAlert(button: buttonAnswerA)
        }
    }
    
    @IBAction func buttonAnswerBHandler(_ sender: Any) {
        if checkIfItIsTheRightAnswer(forButton: butoonAnswerB){
          showRightAnswerAlert(button: butoonAnswerB)
        }else{
          showWrongAnswerAlert(button: butoonAnswerB)
        }
    }
    
    @IBAction func buttonAnswerCHandler(_ sender: Any) {
        if checkIfItIsTheRightAnswer(forButton: buttonAnswerC){
          showRightAnswerAlert(button: buttonAnswerC)
        }else{
          showWrongAnswerAlert(button: buttonAnswerC)
        }
    }
    
    @IBAction func buttonAnswerDHandler(_ sender: Any) {
        if checkIfItIsTheRightAnswer(forButton: buttonAnswerD){
          showRightAnswerAlert(button: buttonAnswerD)
        }else{
          showWrongAnswerAlert(button: buttonAnswerD)
        }

    }
    
    func checkIfItIsTheRightAnswer(forButton button: UIButton) -> Bool{
        button.title(for: .normal) == question?.correctAnswer
    }
    
    private func showWrongAnswerAlert(button:UIButton){
        haveWon = false
        UIView.transition(with: button, duration: 1.3, options: [.transitionFlipFromTop], animations: {
            button.backgroundColor = .red
        }) { (_) in
            let alertController = UIAlertController (title:"WRONG😳", message : "maybe next time ..", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "oh no ...", style : UIAlertAction.Style.default, handler: { [weak self] (_) in
                self?.goToNextScreen()
            }))
            self.present(alertController, animated: true,completion:nil)
        }

    }
    
    private func showRightAnswerAlert(button:UIButton){
        haveWon = true
        rightAnswers += 1
        UIView.transition(with: button, duration: 1.3, options: [.transitionFlipFromBottom], animations: {
            button.backgroundColor = .green
        }) { (_) in
            let alertController = UIAlertController (title:"RIGHT", message : "YEAAAAAAAA It's correct", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "YES", style : UIAlertAction.Style.default, handler: { [weak self] (_) in
                self?.goToNextScreen()
            }))
            self.present(alertController, animated: true,completion:nil)
        }

    }
    
    private func goToNextScreen() {
        guard questions.isEmpty == false,
                let questionViewController = storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController
            else {
            saveGameResult()
            performSegue(withIdentifier: "ResultView", sender: nil)
            return

        }
        //result report
        questionViewController.numberOfQuestions = numberOfQuestions
        questionViewController.rightAnswers = rightAnswers
        questionViewController.questions = questions
        navigationController?.pushViewController(questionViewController, animated: true)
    }
    //save into coredata (database)
    private func saveGameResult() {
        if gameResultDatabaseManager.create(withNumbersOfQuestions: numberOfQuestions, andRightAnswers: rightAnswers) != nil {
            gameResultDatabaseManager.save()
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultViewController = segue.destination as? ResultViewController {
            resultViewController.resultView.resultLabel.text = "🤩 You answered \(rightAnswers) right from \(numberOfQuestions) Questions"
        }
    }

}
