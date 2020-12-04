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
    var question : Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        alertController.addAction(UIAlertAction(title: "oh no ...", style : UIAlertAction.Style.default, handler: {(_) in              self.performSegue(withIdentifier: "ResultView", sender: nil)
        }))
        present(alertController, animated: true,completion:nil)
    }
    
    private func showRightAnswerAlert(button:UIButton){
        haveWon = true
        button.backgroundColor = .green
        let alertController = UIAlertController (title:"FISH", message : "YEAAAAAAAA It's correct", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "YES", style : UIAlertAction.Style.default, handler: {(_) in
            alertController.dismiss(animated: true, completion :nil)
        }))
        present(alertController, animated: true,completion:nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultViewController = segue.destination as? ResultViewController {
            resultViewController.resultView.resultLabel.text = haveWon ? "🤩" : "😟"
        }
    }

}
