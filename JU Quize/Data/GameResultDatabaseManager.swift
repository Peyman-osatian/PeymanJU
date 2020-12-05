//
//  GameResultDatabaseManager.swift
//  JU Quize
//
//  Created by Peyman Osatian on 2020-12-05.
//  Copyright © 2020 Peyman Osatian. All rights reserved.
//

import Foundation
import CoreData

class GameResultDatabaseManager {
    
    func create(withNumbersOfQuestions numberOfQuestions: Int, andRightAnswers rightAnswers: Int) -> GameResult? {
        let managedObjectContext = DatabaseManager.shared.managedObjectContext
        
        let gameResult = NSEntityDescription.insertNewObject(forEntityName: "GameResult", into: managedObjectContext) as? GameResult
        gameResult?.numberOfQuestions = Int32(numberOfQuestions)
        gameResult?.rightAnswers = Int32(rightAnswers)
        gameResult?.date = Date()
        
        return gameResult
    }
    
    func save() {
        DatabaseManager.shared.saveContext()
    }
    
}
