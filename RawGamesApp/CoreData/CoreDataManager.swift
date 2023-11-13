//
//  CoreDataManager.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

import CoreData

private let modelName = "RawGamesApp"

final class CoreDataManager {
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
            favoriteGame.reddit = gameDetail.reddit
            favoriteGame.metacritic = Int32(gameDetail.metacritic ?? 0)
            
            saveContext()
        }
    }
    
    // MARK: Remove Favorite Game
    func removeFavoriteGame(id: Int) {
        let fetchRequest: NSFetchRequest<FavoriteGame> = FavoriteGame.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        
        do {
            let favoritedGames = try context.fetch(fetchRequest)
            
            if let favoritedGame = favoritedGames.first {
                context.delete(favoritedGame)
                
                saveContext()
            }
        } catch {
            print("Error fetching favorited game: \(error)")
        }
    }
    
    // MARK: Fetch Favorite Games
    func fetchFavoriteGames() -> [FavoritedGame] {
        let fetchRequest: NSFetchRequest<FavoriteGame> = FavoriteGame.fetchRequest()
        
        do {
            let favoritedGames = try context.fetch(fetchRequest)
            
            let gameDetails = favoritedGames.map { game in
                FavoritedGame(
                    id: Int(game.id),
                    name: game.name ?? "",
                    description: game.gameDescription ?? "",
                    image: game.backgroundImage,
                    website: game.website,
                    reddit: game.reddit,
                    metacritic: Int(game.metacritic)
                )
            }
            
            return gameDetails
        } catch {
            print("Error fetching favorited games: \(error)")
            return []
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
