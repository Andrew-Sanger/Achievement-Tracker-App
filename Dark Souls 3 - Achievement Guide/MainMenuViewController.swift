//
// MainMenuViewController.swift
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

// This class is the controller for the initial view displayed when the app starts.
// It is a UIView called Main Menu Scene.
//
// It contains 4 buttons which, when pressed segue to the four sections of the app,
// Achievements, Checklists, Statistics and News. It also contains a link to the
// "About" screen of the app containing information about the developer.
//
// When a button is pressed, a segue is initiated to the next view, which is a
// TabBarView. To correctly display the appropriate tab, information is sent with
// the segue to the tabToOpen variable. This ensures the correct tab is opened, if
// this information is not sent, it will always show the first tab no matter which
// button is pressed. Not sure if this goes against the idea of a Controller in MVC, 
// but it was the only solution that worked, other solutions removed the tab bars 
// from the view amongst other things.
//
// UPDATE
// ------
// When the user first comes to this view, a Dark Souls intro sound plays.
class MainMenuViewController: UIViewController {
    // This function plays a short sound using the Cocoa class AVFoundation the first 
    // time the app is started and this screen is presented to the user.
    override func viewDidLoad() {
        // Calls a function in the Model singleton which plays the app_load sound.
        Model.sharedInstance.playInitialSound(Model.SoundToPlay.app_load)
        super.viewDidLoad()
    }
    
    // Overrides the prepareForSegue function so that when a segue is initated, the
    // tabToOpen variable in the next view is changed depending on which button is
    // pressed. This ensures that the next view starts with the correct tab displayed.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Checks which segue is initiated, if it is the aboutSegue (pressed when going
        // to the "About" screen) then the following code is ignored.
        if (segue.identifier != "aboutSegue") {
            // Gets a copy of the next TabBarViewController so that the tabToOpen
            // variable can be changed.
            let nextView = (segue.destinationViewController) as! TabBarViewController
        
            // Checks which segue was initated and changes the tabToOpen variable
            // accordingly.
            if(segue.identifier == "1segue") {
                nextView.tabToOpen = 1
            } else if (segue.identifier == "2segue") {
                nextView.tabToOpen = 2
            } else if (segue.identifier == "3segue") {
                nextView.tabToOpen = 3
            } else if (segue.identifier == "4segue") {
                nextView.tabToOpen = 4
            }
        }
    }
}
