//
//  StartViewController.swift
//  JU Quize
//
//  Created by Mahsa  on 2020-12-02.
//  Copyright © 2020 com.mahsa. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    var questions: [Question] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.isEnabled = false
        downloadQuestions(amount: 5)
        nameTextField.placeholder = "Your Name"
        nameTextField.delegate = self
        nameTextField.returnKeyType = .done
        if let name = UserDefaults.standard.string(forKey: "username") {
            nameTextField.text = name
        }
    }
    
    @IBAction func highscoreButtonHandler(_ sender: Any) {
        let highscoreTableViewController = HighscoreTableViewController()
        navigationController?.pushViewController(highscoreTableViewController, animated: true)
    }
    
    // receiving questions from api url
    private func downloadQuestions(amount: Int) {
        guard let url = URL(string:
            "https://opentdb.com/api.php?amount=\(amount)&type=multiple") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard let data = data else {
                print(error)
                return
            }
            //decoder questions
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let questionsResult = try? decoder.decode(QuestionsResult.self, from: data)
            self?.questions = questionsResult?.results ?? []
            
            DispatchQueue.main.async {
                self?.startButton.isEnabled = true
            }
        }
        task.resume()
    }
    
    // MARK: - Navigation
    
    // send data for next page
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let questionViewController = segue.destination as? QuestionViewController {
            //let question1  = Question(category: "Food", type: .multiple, difficulty: .easy,
            //                         question : "what is your favorit food?" , correctAnswer: "🍤", incorrectAnswers :
            //["🍚","🍕","🥩"])
            //let question2 = Question(category: "Animals", type: .multiple, difficulty: .hard, question: "Which is a mammal?", correctAnswer: //"🐭", incorrectAnswers: ["🐍", "🦋", "🐙"])
            //let questions = [question1, question2, question1]
            questionViewController.numberOfQuestions = questions.count
            questionViewController.questions = questions
        }
    }
   

    @IBAction func exampleButtonHandler(_ sender: Any) {
//        let scrollViewController = ExampleScrollViewController()
//        navigationController?.pushViewController(scrollViewController, animated: true)
        let textScrollViewController = TextScrollViewController()
        navigationController?.pushViewController(textScrollViewController, animated: true)
//        let cameraViewController = CameraViewController()
//        navigationController?.pushViewController(cameraViewController, animated: true)
    }
}

extension StartViewController: UITextFieldDelegate {
    // find out text field editing has been done
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let name = textField.text else {
            return
        }
        UserDefaults.standard.set(name, forKey: "username")
    }
    //keyboard focused out
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
