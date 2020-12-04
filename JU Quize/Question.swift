//
//  Question.swift
//  JU Quize
//
//  Created by Peyman Osatian on 2020-12-03.
//  Copyright © 2020 Peyman Osatian. All rights reserved.
//

import Foundation

struct Question {
    enum QuestionType : String {
        case multiple
    }
    enum Difficulty :String {
        case easy, medium ,hard
    }
    let category : String
    let type : QuestionType
    let Difficulty : Difficulty
    let question : String
    let correctAnswer: String
    let incorrectAnswers : [String]
    
}
