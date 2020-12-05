//
//  GameResult+CoreDataProperties.swift
//  JU Quize
//
//  Created by Peyman Osatian on 2020-12-05.
//  Copyright © 2020 Peyman Osatian. All rights reserved.
//
//

import Foundation
import CoreData


extension GameResult {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameResult> {
        return NSFetchRequest<GameResult>(entityName: "GameResult")
    }

    @NSManaged public var numberOfQuestions: Int32
    @NSManaged public var rightAnswers: Int32
    @NSManaged public var date: Date?

}
