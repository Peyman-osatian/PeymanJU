//
//  HighscoreTableViewController.swift
//  JU Quize
//
//  Created by Mahsa  on 2020-12-03.
//  Copyright © 2020 com.mahsa. All rights reserved.
//

import UIKit
import CoreData

class HighscoreTableViewController: UITableViewController {
    var fetchedResultsController: NSFetchedResultsController<GameResult>!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "highscoreIdentifier")
        setupFetchedResultsController()
    }
    // receive data from core
    private func setupFetchedResultsController() {
        let managedObjectContext = DatabaseManager.shared.managedObjectContext
        
        let request = NSFetchRequest<GameResult>(entityName: "GameResult")
        let dateSort = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [dateSort]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize fetchedResultsController")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "highscoreIdentifier", for: indexPath)

        let gameResult = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = "Out of \(gameResult.numberOfQuestions) you answered \(gameResult.rightAnswers) rights"
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


}

extension HighscoreTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected this row: \(indexPath.row)")
    }
}
