//
//  Question.swift
//  JU Quize
//
//  Created by Mahsa  on 2020-12-02.
//  Copyright © 2020 com.mahsa. All rights reserved.
//

import Foundation

struct Question: Decodable {
    enum QuestionType : String, Decodable {
        case multiple
    }
    enum Difficulty :String, Decodable {
        case easy, medium ,hard
    }
    let category : String
    let type : QuestionType
    let difficulty : Difficulty
    let question : String
    let correctAnswer: String
    let incorrectAnswers : [String]
    
}
