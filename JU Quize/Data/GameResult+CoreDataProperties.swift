//
//  GameResult+CoreDataProperties.swift
//  JU Quize
//
//  Created by Mahsa  on 2020-12-05.
//  Copyright © 2020 com.mahsa. All rights reserved.
//

import Foundation
import CoreData


extension GameResult {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameResult> {
        return NSFetchRequest<GameResult>(entityName: "GameResult")
    }
    // data that will be save in the coredata db
    @NSManaged public var numberOfQuestions: Int32
    @NSManaged public var rightAnswers: Int32
    @NSManaged public var date: Date?

}
