//
//  CoreDataManager.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 4/24/23.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    var scoreArray = [StatsManager]()
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Main")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
        return container
    }()
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("error")
            }
        }
    }
    
    
    /**
     Add the passed score to CoreData.
     */
    func addScore(score: Int) {
        let statsManager = StatsManager(context: self.context)
        statsManager.score = Int16(score)
        saveContext()
        
    }
    
    /**
     Retrieve all the scores from CoreData.
     */
    @discardableResult
    func fetchScores() -> [StatsManager] {
        let fetchRequest : NSFetchRequest<StatsManager> = {
            let request = NSFetchRequest<StatsManager>(entityName: "StatsManager")
            // request.predicate = NSPredicate(value: true)
            return request
        }()
        
        do {
            scoreArray = try context.fetch(fetchRequest)
        } catch {
            print("Error fetching data from context \(error)")
        }
        
        return scoreArray
    }
    
    /**
     Calculate the high score.
     */
    func calculateHighScore() -> Int {
        let sortedArray = scoreArray.sorted(by: { firstStats, secondStats in
            firstStats.score > secondStats.score
        })
        guard let maxScore = sortedArray.first else {
            return 0
        }
        return Int(maxScore.score)
    }
}
