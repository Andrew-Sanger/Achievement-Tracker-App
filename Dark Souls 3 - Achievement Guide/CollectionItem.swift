//
// CollectionItem.swift
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

// This class contains all information about individual items found in a collection achievement.
// Contains the items name, description, location, individual it is acquired from and a short guide
// showing how to obtain it. Also contains a Boolean value showing whether the item has been
// collected or not.
//
// UPDATE
// ------
// As with the Achievement and CollectionAchievement classes, this class has been altered to 
// hold a CDCollectionItem object instead of seperate variables.
class CollectionItem {
    // CDCollectionItem object containing all necessary data.
    private var itemInfo: CDCollectionItem
    
    // Initialises class bases on passed CDCollectionItem
    init(itemInfo: CDCollectionItem) {
        self.itemInfo = itemInfo
    }
    
    // Toggles whether this item has been collected or not. Toggles from true to false.
    func toggleCollected() {
        Model.sharedInstance.itemObtainToggle(itemInfo)
    }
    
    // Getters for all information in this class. Setters are not needed because this information
    // should never need to be changed.
    func isCollected() -> Bool {
        return itemInfo.isCollected
    }
    
    func getItemName() -> String {
        return itemInfo.itemName
    }
    
    func getItemDesc() -> String {
        return itemInfo.itemDesc
    }
    
    func getItemLoc() -> String {
        return itemInfo.itemLoc
    }
    
    func getItemAcq() -> String {
        return itemInfo.itemAcqFrom
    }
    
    func getItemGuide() -> String {
        return itemInfo.itemGuide
    }
    
    func getItemIcon() -> String {
        return itemInfo.itemIcon
    }
    
    func getCDCollectionItem() -> CDCollectionItem {
        return self.itemInfo
    }
}