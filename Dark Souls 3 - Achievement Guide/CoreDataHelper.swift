//
// CoreDataHelper.swift
//
// iPhone Software Engineering - SP2 2016
// --------------------------------------
// Assignment 2
// Dark Souls 3 - Achievement Guide
//
// Created by Andrew Sanger on 21/08/2016.
// Copyright © 2016 Andrew Sanger. All rights reserved.
//

import Foundation
import UIKit
import CoreData

// This class is used as an interface between the rest of the code and the CoreData.
// If the app has not been run before then all achievement details are created and put
// into CoreData using the AchievementSeed class. This class is only ever accessed once
// and when data is put into CoreData it is never run again unless you wish to remove the
// data yourself.
class CoreDataHelper {
    // These two variables should always be set to false. The first variable will format
    // all data from coredata, and the second will put all data back into coredata again.
    // If the second value is set to true then multiple instances of the data will be
    // created.
    var COREDATA_FORMAT = false
    var COREDATA_INITIALISATION = false
    
    // Coredata helper variables. Used to access CoreData
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var managedContext: NSManagedObjectContext {
        get {
            return appDelegate.managedObjectContext
        }
    }
    
    // Struct used to hold singleton instance of CoreDataHelper.
    private struct Static {
        static var instance: CoreDataHelper?
    }
    
    // Singleton var used to initiate and return CoreDataHelper instance.
    class var sharedInstance: CoreDataHelper {
        if !(Static.instance != nil) {
            Static.instance = CoreDataHelper()
        }
        
        return Static.instance!
    }
    
    // This init, will check to see whether data exists in CoreData already and will create it
    // if it doesnt exist. 
    //
    // WARNING
    // -------
    // It is possible to delete all data if COREDATA_FORMAT is true, and possible to double
    // up on data if COREDATA_INITIALISATION is true when data alread exists. 
    //
    // *****************************************************************************************
    // ** If you wish to restore data to its original state (eg remove obtained achievements) **
    // ** then please set COREDATA_FORMAT to true. This will reset the CoreData.              **
    // *****************************************************************************************
    private init() {
        // Deletes all coreData
        if COREDATA_FORMAT == true {
            deleteAllData("Achievement")
            deleteAllData("CollectionItem")
            COREDATA_FORMAT = false
        }
        
        // Checks if coreData is empty and initialises if it is.
        if checkCoreDataIsEmpty("Achievement") {
            COREDATA_INITIALISATION = true
        }
        
        // Creates coredata.
        if COREDATA_INITIALISATION == true {
            // Creates an instance of AchievementSeed, containing all data.
            let seedData: AchievementSeed = AchievementSeed()

            // Initialises all achievement info into their appropriate arrays, as individual structs.
            let achievementInfo: [AchievementSeed.AchievementSeed] = seedData.getAchInfo()
            let mastOfInfusionCollection: [AchievementSeed.ItemSeed] = seedData.getInfColl()
            let mastOfSorceriesCollection: [AchievementSeed.ItemSeed] = seedData.getSorColl()
            let mastOfPyromanciesCollection: [AchievementSeed.ItemSeed] = seedData.getPyrColl()
            let mastOfMiraclesCollection: [AchievementSeed.ItemSeed] = seedData.getMirColl()
            let mastOfRingsCollection: [AchievementSeed.ItemSeed] = seedData.getRinColl()
            let mastOfExpressionCollection: [AchievementSeed.ItemSeed] = seedData.getExpColl()
            
            // Updates all achievements into the database.
            for achievement in achievementInfo {
                saveAchievement(achievement.number, achName: achievement.name, achScore: achievement.score,
                                achDesc: achievement.description, achGuide: achievement.guide,
                                isCollection: achievement.isCollection, isObtained: achievement.isObtained,
                                achIcon: achievement.iconLocation)
            }
            
            // Updates all collection items into the database.
            saveCollection(mastOfInfusionCollection)
            saveCollection(mastOfSorceriesCollection)
            saveCollection(mastOfPyromanciesCollection)
            saveCollection(mastOfMiraclesCollection)
            saveCollection(mastOfRingsCollection)
            saveCollection(mastOfExpressionCollection)
        }
    }
    
    // This function checks whether CoreData is empty and returns a boolean if it is.
    func checkCoreDataIsEmpty(entity: String) -> Bool {
        do {
            // Attempts to fetch data from CoreData
            let fetchRequest = NSFetchRequest(entityName: entity)
        
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            
            // If no results exist then returns true.
            if results.count == 0 {
                return true
            } else {
                return false
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return false
    }
    
    // This function replaces the old one from Model, it toggles the obtained
    // value in the achievement to true and false.
    func achievementObtainToggle(toBeToggled: CDAchievement) {
        if toBeToggled.isObtained == true {
            toBeToggled.isObtained = false
        } else {
            toBeToggled.isObtained = true
        }
        
        // This call will update CoreData.
        updateDatabase()
    }
    
    // This function replaces the old one from Model, it toggles the obtained
    // value in the item to true and false.
    func itemObtainToggle(toBeToggled: CDCollectionItem) {
        if toBeToggled.isCollected == true {
            toBeToggled.isCollected = false
        } else {
            toBeToggled.isCollected = true
        }
        
        // This call will updata CoreData
        updateDatabase()
    }
    
    // This function creates a new achievement and saves it to CoreData.
    func saveAchievement(achNumber: Int16, achName: String, achScore: Int16, achDesc: String, achGuide: String,
                         isCollection: Bool, isObtained: Bool, achIcon: String) {
        let newAchieve = NSEntityDescription.entityForName("Achievement", inManagedObjectContext: managedContext)
        
        let achievement = CDAchievement(entity: newAchieve!, insertIntoManagedObjectContext: managedContext)
        achievement.achNumber = achNumber
        achievement.achName = achName
        achievement.achScore = achScore
        achievement.achDesc = achDesc
        achievement.achGuide = achGuide
        achievement.isCollection = isCollection
        achievement.isObtained = isObtained
        achievement.achIcon = achIcon
        
        updateDatabase()
    }
    // This function creates a new item and saves it to CoreData.
    func saveItem(belongsTo: Int16, itemName: String, itemDesc: String, itemLoc: String, itemAcq: String,
                  itemGuide: String, isObtained: Bool, itemIcon: String) {
        let newItem = NSEntityDescription.entityForName("CollectionItem", inManagedObjectContext: managedContext)
        
        let item = CDCollectionItem(entity: newItem!, insertIntoManagedObjectContext: managedContext)
        item.belongsTo = belongsTo
        item.itemName = itemName
        item.itemDesc = itemDesc
        item.itemLoc = itemLoc
        item.itemAcqFrom = itemAcq
        item.itemGuide = itemGuide
        item.isCollected = isObtained
        item.itemIcon = itemIcon
        
        updateDatabase()
    }
    
    // This function is a helper function which iterates over an array of Items, and saves them to
    // CoreData
    func saveCollection(currentCollection: [AchievementSeed.ItemSeed]) {
        for item in currentCollection {
            saveItem(item.belongsTo, itemName: item.name, itemDesc: item.description, itemLoc: item.location,
                     itemAcq: item.acquiredFrom, itemGuide: item.guide, isObtained: item.isCollected,
                     itemIcon: item.iconLocation)
        }
    }
    
    // This function accesses CoreData and retrieves all entities named "Achievement".
    // These entitites are turned into CDAchievements and placed in an array. This array
    // is then returned.
    func getCDAchievements() -> [CDAchievement] {
        // Array to hold all CDAchievements
        var coreAchievementList: [CDAchievement] = [CDAchievement]()
        
        // Fetches all Achievements entities in CoreData, turns them into CDAchievement
        // objects and saves them to the array.
        do {
            let fetchRequest = NSFetchRequest(entityName: "Achievement")
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            coreAchievementList = results as! [CDAchievement]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return coreAchievementList
    }
    
    // This function accesses CoreData and retrieves all entities named "Item".
    // These entitites are turned into CDCollectionItem and placed in an array. This array
    // is then returned.    
    func getCDCollectionItems() -> [CDCollectionItem] {
        // Array to hold all CDCollectionItems
        var coreItemList: [CDCollectionItem] = [CDCollectionItem]()
        
        // Fetches all Item entities in CoreData, turns them into CDCollectionItem
        // objects and saves them to the array.
        do {
            let fetchRequest = NSFetchRequest(entityName: "CollectionItem")
            let results =
                try managedContext.executeFetchRequest(fetchRequest)
            coreItemList = results as! [CDCollectionItem]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return coreItemList
    }
    
    // This function goes through all items in CoreData which match 'entity' and
    // deletes them one by one. It then saves the database.
    func deleteAllData(entity: String) {
        let fetchRequest = NSFetchRequest(entityName: entity)
        
        // Iterates over all entities that match fetchRequest and deletes them
        // one by one.
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            for managedObjects in results {
                let managedObjectData: NSManagedObject = managedObjects as! NSManagedObject
                managedContext.deleteObject(managedObjectData)
            }
        } catch let error as NSError {
            print("Delete all data in \(entity) error : \(error) \(error.userInfo)")
        }
        
        updateDatabase()
    }
    
    // This function will update the database, so that any information that has changed
    // is updated.
    func updateDatabase() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    // This function will create an array of achievements. First it retrieves all CDAchievements
    // from CoreData, then creates new Achievement or CollectionAchievement objects and places them
    // in an array. This array is then returned.
    func createAchievementArray() -> [Achievement] {
        // Array to hold Achievement objects.
        var newAchievementArray: [Achievement] = [Achievement]()
        // Gets all CDAchievements from CoreData
        let currentCDAchievements: [CDAchievement] = getCDAchievements()
        
        // Iterates over array and creates objects based on whether they are collection
        // achievements or not.
        for current in currentCDAchievements {
            if current.isCollection == true {
                newAchievementArray.append(CollectionAchievement(achievementInfo: current))
            } else {
                newAchievementArray.append(Achievement(achievementInfo: current))
            }
        }
        
        return newAchievementArray
    }
    
    // This function will add items to their relevant achievement. First it gets all CDCollectionItems
    // and checks the whether the items 'belongTo' value matces the achievement number, and if it
    // does then it is added to that achievement.
    func addItemsToCollections(currentAchievements: [Achievement]) -> [Achievement] {
        let currentCDCollectionItems: [CDCollectionItem] = getCDCollectionItems()
        
        for current in currentCDCollectionItems {
            for currentAch in currentAchievements {
                if currentAch.isCollection() == true {
                    if currentAch.getAchNumber() == current.belongsTo {
                        let currentCollAch = currentAch as! CollectionAchievement
                        
                        currentCollAch.addItemToList(current)
                    }
                }
            }
        }
        
        return currentAchievements
    }
}
