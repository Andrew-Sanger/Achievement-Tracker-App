//
// ChecklistController.swift
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

// This class is the controller for the 2nd tab of the app called Checklists.
// It is a UITableView called Checklists Scene.
//
// It shows a table containing the names of all Collection Achievements, and a 
// button which is red when the achievement has not been obtained and green when 
// obtained. When a table row is pressed it will segue to the next view which contains 
// a checklist of all items required to obtain the achievement.
//
// UPDATE
// ------
// This class has been updated so that it shows the achievements icon next to the name.
// It also shows a checkbox instead of a green/red box.
class ChecklistViewController: UITableViewController {
    // Variable containing an array containing links to all collection achievements.
    // And yes i know checklistList sounds ridiculous but it works.
    let checklistList: [Achievement] = Model.sharedInstance.getAchievementsOfType(
        Model.CollectionType.collection)
    
    // Ensures the top navigation bar is translucent, which makes sure that the table view
    // does not disappear underneath it.    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.translucent = false
    }
    
    // Returns how many achievements are in the checklistList.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklistList.count
    }
    
    // Creates all cells in the table. Changes label text to show achievement name and
    // colours button depending on whether it has been obtained or not.
    override func tableView(tableView: UITableView,
                            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Uses the custom cell ObtainableCell containing a label to the left and a button on the right.
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistCell",
                                                               forIndexPath: indexPath) as! ObtainableCell
        // Changes label text to be achievement name.
        cell.achievementName.text = checklistList[indexPath.row].getAchName()
        // Displays achievements icon next to the name.
        cell.achievementImage.image = UIImage(named: checklistList[indexPath.row].getAchIcon())
        
        // Displays either a checked or unchecked box the the right of the acheievement name.
        if (checklistList[indexPath.row].isObtained()) {
            cell.achievementObtained.image = UIImage(named: ("checked"))
        } else {
            cell.achievementObtained.image = UIImage(named: ("unchecked"))
        }
        
        return cell
    }
    
    // When a row is pressed this segue is carried out which transitions to the next view showing a
    // detailed checklist displaying all items in the collection achievement.
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("ChecklistDetailSegue", sender: tableView)
    }
    
    // Sends information to the next controller containing details on the achievement pressed and a
    // link to the current viewController so that it can be updated when achievement is obtained.    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Creates a link to the next view controller.
        let checkViewController = segue.destinationViewController as! ChecklistDetailViewController
        
        // Gets the location of the current achievement.
        let indexPath = self.tableView.indexPathForSelectedRow!
        
        // Gets the currently selected achievement.
        let sentAchievement = checklistList[indexPath.row] as! CollectionAchievement
        
        // Sends information to the next view to help with correct display and updating of the
        // selected achievements checklist.
        checkViewController.currentAchievement = sentAchievement
        checkViewController.currentChecklistList = sentAchievement.getCollectionList()
        checkViewController.previousCheckTabView = self
        checkViewController.isPrevViewCheck = true
    }
}