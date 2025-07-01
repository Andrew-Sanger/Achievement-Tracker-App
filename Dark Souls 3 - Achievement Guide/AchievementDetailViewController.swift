//
// AchievementDetailController.swift
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

// This class is the controller for the detail view shown when an achievement is
// pressed in the achievement view. It is a UIView called Achievement Detail View 
// Controller Scene.
//
// It shows all information about the currently selected achievement including its
// name, gamerscore, description, guide and an image (NYI) of the achievement image.
// It also creates a button at the bottom of the screen which changes depending on
// whether it is a regular or collection acheivement. If it is a regular achievement
// you can press this button to mark it as obtained. If it is a collection achievement
// this is not possible because you need to obtain certain items to complete the 
// achievement, so instead it shows a button you can press to be able to view the
// items needed to complete the achievement.
//
// UPDATE
// ------
// When the obtain achievement button is pressed, a short sound is played using the
// Cocoa class AVFoundation.
//
// The statistics view is now refreshed whenever an achievement is obtained. This is
// to ensure that the percentage complete counts are correct.
//
// Also the achievementImage UIImageView is updated with newly supplied image, and
// the acheivement obtained button has been replaced with an image instead of a 
// red/green box.
class AchievementDetailViewController: UIViewController {
    // Contains links to the current achievement, and the previous controller.
    var currentAchievement: Achievement!
    var previousTabView: AchievementTableViewController!
    
    // Creates links to all appropriate items in the view.
    @IBOutlet weak var achievementName: UILabel!
    @IBOutlet weak var gamerScore: UILabel!
    @IBOutlet weak var achievementDesc: UILabel!
    @IBOutlet weak var achievementGuide: UILabel!
    @IBOutlet weak var achievementImage: UIImageView!
    @IBOutlet weak var obtainedButton: UIButton!
    @IBOutlet weak var moveToCheckButton: UIButton!
    @IBOutlet weak var obtainedLabel: UILabel!
    
    // Initates the current view depending on the achievement selected. If it is a regular
    // achievement it will show an "Obtain achievement" button, and if it is a collection
    // will show a button that links to the checklist for this achievement.
    override func viewDidLoad() {
        // Fills in appropriate information in the view.
        achievementName.text = currentAchievement.getAchName()
        gamerScore.text = "\(String(currentAchievement.getAchScore())) points"
        achievementDesc.text = currentAchievement.getAchDesc()
        achievementGuide.text = currentAchievement.getAchGuide()
        achievementImage.image = UIImage(named: currentAchievement.getAchIcon())
        
        // Calls the setButton function which sets the regular achievement button to
        // either red or green depending on whether it has been obtained or not.
        self.setButton()

        // Displays the correct button type depending on whether the current achievement
        // is regular or a collection achievement. Also changes the label above it to show
        // relevant info.
        if (currentAchievement.isCollection()) {
            self.obtainedButton.hidden = true
            self.moveToCheckButton.hidden = false
            
            self.obtainedLabel.text = "Examine Checklist"
        } else {
            self.obtainedButton.hidden = false
            self.moveToCheckButton.hidden = true
            
            self.obtainedLabel.text = "Complete?"
        }        
    }
    
    // This function is triggered when the "Obtain achievement" button is pressed. Toggles
    // the current achievement to show that it has been obtained. Then calls the setButton
    // function to update the button colour.
    @IBAction func obtainButton(sender: UIButton) {
        currentAchievement.obtainToggle()
        
        // This line is important and is the only reason we have a link to the previous View
        // Controller. When the current achievement is obtained, the previous screen view
        // will be refreshed to show that the achievement is obtained. If this does not occur
        // then the previous screen will continue to show the achievemnt as not having been
        // obtained.
        previousTabView.tableView.reloadData()
        
        self.setButton()
        
        // These lines firstly play the item_get sound, and then reload the statistics tab
        // to ensure information is correct.
        Model.sharedInstance.playInitialSound(Model.SoundToPlay.item_get)
        Model.sharedInstance.statisticsController?.viewDidLoad()
    }
    
    // This function carries out a segue to the checklist view for this achievement, when the
    // appropriate button is pressed.
    @IBAction func moveToChecklist() {
        self.performSegueWithIdentifier("ShowCheckFromAchieveSegue", sender: self)
    }
    
    // This function changes the obtained button to show it is either a checked box or not.
    func setButton() {
        if (currentAchievement.isObtained()) {
            obtainedButton.setImage(UIImage(named: "checked"), forState: .Normal)
        } else {
            obtainedButton.setImage(UIImage(named: "unchecked"), forState: .Normal)
        }
    }
    
    // This function only occurs when the achievement displayed is a collection achievement and the
    // "view checklist" button is pressed at the bottom of the screen. Send relevant information to
    // the checklist view. Also sends a link to the previous table view controller so that it can
    // be refreshed when all items in the achievement are obtained. Also sends a boolean value to show
    // whether the next view was segued to from this Controller or the ChecklistViewController.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let checkViewController = segue.destinationViewController as! ChecklistDetailViewController
        
        let sentAchievement = currentAchievement as! CollectionAchievement
        
        checkViewController.currentAchievement = sentAchievement
        checkViewController.currentChecklistList = sentAchievement.getCollectionList()
        checkViewController.previousAchieveTabView = self.previousTabView
        checkViewController.isPrevViewCheck = false
    }
}
