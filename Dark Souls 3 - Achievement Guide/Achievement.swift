//
// Achievement.swift
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

// This class contains all information that makes up a regular achievemnt, in other
// words, its name, gamer score, description, guide, whether it is a collection
// achievement and whether the achievement has been obtained.
//
// CollectionAchievements inherit this information and add details based on items
// needed to complete the achievement.
//
// UPDATE
// ------
// This class has been updated to hold a CDAchievement item, which holds all relevant
// achievement info from CoreData. This class could now be considered a wrapper,
// instead of implementing a whole new way of dealing with the info i decided to use
// this already implemented class and methods, and just change them to use the 
// CDAchievement object instead of seperate variables.
class Achievement {
    // CDAchievement object containing all achievement variables taken from CoreData
    private var achievementInfo: CDAchievement
    
    init(achievementInfo: CDAchievement) {
        self.achievementInfo = achievementInfo
    }
    
    // Toggles whether this achievement has been obtained or not. From true to false
    // and vice versa.
    func obtainToggle() {
        Model.sharedInstance.achievementObtainToggle(achievementInfo)
    }
    
    // Getters for information contained in the class. No setters are needed because
    // information in this class will never need to be changed.
    func getAchNumber() -> Int16 {
        return achievementInfo.achNumber
    }
    
    func getAchName() -> String {
        return achievementInfo.achName
    }
    
    func getAchScore() -> Int {
        return Int(achievementInfo.achScore)
    }
    
    func getAchDesc() -> String {
        return achievementInfo.achDesc
    }
    
    func getAchGuide() -> String {
        return achievementInfo.achGuide
    }
    
    func getAchIcon() -> String {
        return achievementInfo.achIcon
    }
    
    func isCollection() -> Bool {
        return achievementInfo.isCollection
    }
    
    func isObtained() -> Bool {
        return achievementInfo.isObtained
    }
    
    func getCDAchieve() -> CDAchievement {
        return achievementInfo
    }
}