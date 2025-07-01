//
// CollectionAchievement.swift
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

// This class inherits the Achievement class. It contains all extra information to show
// CollectionItems needed to complete the achievement. Contains an array containing all
// Items, and has a function which checks whether all items have been collected and if
// so, changes the Achievement status to Completed.
//
// UPDATE
// ------
// As with the Achievement class, this has been altered to use CDAchievement objects
// instead of the original seperate variables.
//
// Created an enum to help classify which collection type is being requested.
class CollectionAchievement: Achievement {
    // Variables containing the CollectionItems needed to be able to complete the
    // achievement.
    private var collectionList: [CollectionItem] = [CollectionItem]()
    private var numberOfItems: Int
    
    // Enum used to indicate which collection type is being requested.
    enum CollectionType: Int16 {
        case Infusion = 10
        case Sorceries
        case Pyromancies
        case Miracles
        case Rings
        case Expression
    }
    
    // Initiates class based on information passed to it.
    override init(achievementInfo: CDAchievement) {
        self.numberOfItems = 0
        
        super.init(achievementInfo: achievementInfo)
    }
    
    // Adds a CollectionItem item to the collectionList array based on information passed to
    // it.
    //
    // Changed to implement CDCollectionItems
    func addItemToList(newItem: CDCollectionItem) {
        let newItem: CollectionItem = CollectionItem(itemInfo: newItem)
        
        collectionList.append(newItem)
        self.numberOfItems += 1
    }
    
    // This function iterates over the collectionList array and checks whether all Items have
    // been obtained, and if so changes the achievement status to complete.
    func checkIfObtained() {
        var hasBeenCompleted: Bool = true
        
        for currentItem in collectionList {
            if !(currentItem.isCollected()) {
                hasBeenCompleted = false
            }
        }
        
        if (hasBeenCompleted != self.isObtained()) {
               self.obtainToggle()
        }
    }
    
    // Returns an array containing all CollectionItems contained in this achievement.
    func getCollectionList() -> [CollectionItem] {
        return collectionList
    }
    
    // Returns an Int containing the number of CollectionItems in this achievement.
    func getNumberOfItems() -> Int {
        return numberOfItems
    }
}