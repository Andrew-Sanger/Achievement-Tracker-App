//
// Model.swift
//
// iPhone Software Engineering - SP2 2016
// --------------------------------------
// Assignment 2
// Dark Souls 3 - Achievement Guide
//
// Created by Andrew Sanger on 21/08/2016.
// Copyright © 2016 Andrew Sanger. All rights reserved.
//

import UIKit
import Foundation
import CoreData
import AVFoundation

// This class is the model class for the app, it holds all information used for the app.
// Currently this information is hard coded into classes, in future iterations of the app
// this will not be the case. All achievements in the app come in two varieties, regular
// achievements and collection achievements. Regular achievements are contained in Achievement 
// classes while collection achievements are contained CollectionAchievement classes which
// inherit all Achievement methods. CollectionAchievement classes contain an array containing
// CollectionItem objects which represent all items needed to complete the achievement.
//
// The Model class uses the Singleton design to ensure only one instance is ever made.
//
// UPDATE
// ------
// Uses the CoreDataHelper class to put all achievements into the achievemtnList array.
//
// Now works out percentages of achievements complete and sends info to the relevant
// controllers.
//
// Implements the AVAudioPlayer from the AVFoundation Cocoa framework to play sounds
// at certain times during the running of the app.
class Model {
    // Array containing all achievements in the app.
    private var achievementList: [Achievement] = [Achievement]()
    private var isFirstTimeLoading: Bool = true
    
    var statisticsController: UIViewController?
    var audioPlayer: AVAudioPlayer? = nil
    
    // Enum used to show which type of Achievement is being returned.
    enum CollectionType {
        case regular
        case collection
    }
    
    // Enum used to show which sound is being played.
    enum SoundToPlay {
        case about_screen
        case app_load
        case item_get
    }
    
    // Struct used to hold singleton instance of Model.
    private struct Static {
        static var instance: Model?
    }
    
    // Singleton var used to initiate and return Model instance.
    class var sharedInstance: Model {
        if !(Static.instance != nil) {
            Static.instance = Model()
        }
        
        return Static.instance!
    }
    
    // This init was changed greatly from the initial init, it calls the CoreDataHelper
    // class to get all information into the achievementList array. Whilst the
    // achievementList array is essentially the same, the information inside is slightly
    // different, please check the appropriate classes.
    private init() {
        achievementList = CoreDataHelper.sharedInstance.createAchievementArray()
        achievementList = CoreDataHelper.sharedInstance.addItemsToCollections(achievementList)
    }
    
    // Returns all achievements in the app as an array.
    func getAllAchievements() -> [Achievement] {
        return achievementList
    }
    
    // Returns either regular or collection achievements based on which enum value
    // is passed to it.
    func getAchievementsOfType(type: CollectionType) -> [Achievement] {
        var achievementOfType: [Achievement] = [Achievement]()
        
        for achievement in achievementList {
            if (type == .regular && !(achievement.isCollection())) {
                achievementOfType.append(achievement)
            } else if (type == .collection && achievement.isCollection()) {
                achievementOfType.append(achievement)
            }
        }
        
        return achievementOfType
    }
    
    // Updated function which toggles the achievement as being obtained or not.
    // Updated due to the implementation of CoreData.
    func achievementObtainToggle(toBeToggled: CDAchievement) {
        CoreDataHelper.sharedInstance.achievementObtainToggle(toBeToggled)
    }
    
    // Updated function which toggles the item as being obtained or not.
    // Updated due to the implementation of CoreData.
    func itemObtainToggle(toBeToggled: CDCollectionItem) {
        CoreDataHelper.sharedInstance.itemObtainToggle(toBeToggled)
    }
    
    // This function returns a float showing what percentage of achievements have been
    // obtained. It does this by iterating through all achievements and determining whether
    // it has been obtained or not.
    func returnPercentageComplete() -> Float {
        // Helper variables.
        var achTotal: Float = 0
        var obtTotal: Float = 0
        var finalPercentage: Float = 0
        
        // Iterates throught array and determines:
        // 1: How many achievements there are.
        // 2: How many achievements have been obtained.
        for current in achievementList {
            achTotal = achTotal + 1
            
            if current.isObtained() {
                obtTotal = obtTotal + 1
            }
        }
        
        // The final percentage.
        finalPercentage = (obtTotal / achTotal) * 100
        
        return finalPercentage
    }
    
    // This function returns a float showing what percentage of items have been
    // obtained in their respective collection achievements. Takes a enum collectionType
    // which helps decide which achievement to check.
    func returnCollectionPercentage(currentColl: CollectionAchievement.CollectionType)
        -> Float{
        // Helper variables.
        var itemTotal: Float = 0
        var obtTotal: Float = 0
        var finalPercentage: Float = 0
        
        // Iterates over every achievement and checks wheterh it is the correct 
        // collection achievement. If it is, then it iterates over every item
        // in that achievement and counts how many items in total, and how many
        // are obtained.
        for currentAch in achievementList {
            if currentAch.getAchNumber() == currentColl.rawValue {
                let achAsColl: CollectionAchievement = currentAch as! CollectionAchievement
                let collList: [CollectionItem] = achAsColl.getCollectionList()
                
                for item in collList {
                    itemTotal = itemTotal + 1
                    
                    if item.isCollected() {
                        obtTotal = obtTotal + 1
                    }
                }
            }
        }
        
        // The final percentage completed.
        finalPercentage = (obtTotal / itemTotal) * 100
        
        return finalPercentage
    }
    
    // This function is used to play a small sound bit using the Cocoa class AVFoundation.
    // It plays a sound when the app is initially started, when the About tab is entered,
    // and whenever the achievement obtain button is pressed.
    //
    // It does this by using the AVAudioPlayer class from the AVFoundation package.
    //
    // NOTE:
    // -----
    // There is a non urgent bug in this class which i cannot fix. It doesnt affect the
    // running of the app but it still comes up in XCode. It reads "ERROR: 181: timed out
    // after 0.012s (972 972); mMajorChangePending=0". I have tried many things to try and
    // fix this.. I tried halting the app until the sound played, but this was not ideal.
    // Finally i tried running the audioPlayer object in a seperate thread, but the bug
    // still comes up. I have decided to leave it because i have spent way too much time
    // on it already, plus it doesnt effect the running of the app.
    func playInitialSound(sound: SoundToPlay) {
        var soundName: NSURL
        self.audioPlayer = nil
        
        // This checks whether it is the first time running the app and selects the
        // "app_load" sound if so. If not then it selects either of the other two sounds.
        if (self.isFirstTimeLoading == true && sound == SoundToPlay.app_load) {
            soundName = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(
                "app_load", ofType: "mp3")!)
            
            // Ensures this sound plays only once every time the app is opened.
            self.isFirstTimeLoading = false
        } else {
            if sound == SoundToPlay.about_screen {
                soundName = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(
                    "about_welcome", ofType: "mp3")!)
            } else {
                soundName = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(
                    "item_get", ofType: "mp3")!)
            }
        }
    
        // Attempts to play the selected sound, and throws an error if it cant. The 
        // AVAudioPlayer is run in a seperate thread to try and stop the above mentioned
        // error, but it does not work.
        do {
            try self.audioPlayer = AVAudioPlayer(contentsOfURL: soundName)
            self.audioPlayer!.prepareToPlay()
            
            dispatch_async(dispatch_get_main_queue(), {
                (self.audioPlayer!.play())
            })
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
}