//
//  QuestionsResult.swift
//  JU Quize
//
//  Created by Mahsa  on 2020-12-02.
//  Copyright © 2020 com.mahsa. All rights reserved.
//

import Foundation
// array of questions model
struct QuestionsResult: Decodable {
    let results: [Question]
    
}
