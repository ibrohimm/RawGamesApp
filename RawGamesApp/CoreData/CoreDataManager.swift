//
//  CoreDataManager.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

import CoreData

private let modelName = "RawGamesApp"

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    // MARK: - Init
    private init() {
        
    }
    
    // MARK: - Core Data Saving support
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Core Data Operations
    
    // MARK: Add Favorite Game
    func addFavoriteGame(gameDetail: GameDetail) {
        if !isGameFavorited(id: gameDetail.id) {
            let favoriteGame = FavoriteGame(context: context)
            favoriteGame.id = Int32(gameDetail.id)
            favoriteGame.name = gameDetail.name
            favoriteGame.gameDescription = gameDetail.gameDetailModelDescription
            favoriteGame.backgroundImage = gameDetail.backgroundImage
            favoriteGame.website = gameDetail.website
            
            saveContext()
        }
    }
    
    // MARK: Remove Favorite Game
    func removeFavoriteGame(id: Int) {
        let fetchRequest: NSFetchRequest<FavoriteGame> = FavoriteGame.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        
        do {
            let favoritedGames = try context.fetch(fetchRequest)
            
            // Assuming there is only one favorited game with a given ID
            if let favoritedGame = favoritedGames.first {
                context.delete(favoritedGame)
                
                saveContext()
            }
        } catch {
            print("Error fetching favorited game: \(error)")
        }
    }
    
    // MARK: Check if Game is Favorited
    func isGameFavorited(id: Int) -> Bool {
        let fetchRequest: NSFetchRequest<FavoriteGame> = FavoriteGame.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        
        do {
            let favoritedGames = try context.fetch(fetchRequest)
            return !favoritedGames.isEmpty
        } catch {
            print("Error checking if game is favorited: \(error)")
            return false
        }
    }
}
