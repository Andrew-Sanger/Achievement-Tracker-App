//
// ChecklistDetailViewController.swift
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

// This class is the controller for the checklist view which displays all items
// needed to complete a Collection achievement.
//
// It is a UITableView called Checklists Detail View Controller Scene.
//
// It shows a table containing the names of all items in the current Collection 
// Achievement, and a button which is red when the achievement has not been obtained 
// and green when obtained. When a table row is pressed it will segue to the next 
// view which contains a detailed view of the selected item.
class ChecklistDetailViewController: UITableViewController {
    // Variables containing links to the current achievement, and an array containing
    // links to the checklist for the current achievement. Also contains 2 possible link
    // to previous viewControllers, which could be either a ChecklistViewController
    // or an AchievementTableViewController. This is so the previous view can be updated
    // when an achievement is obtained. The final variable is a Boolean value to help
    // understand which view was previous.
    var currentAchievement: Achievement!
    var currentChecklistList: [CollectionItem]!
    var previousCheckTabView: ChecklistViewController!
    var previousAchieveTabView: AchievementTableViewController!
    var isPrevViewCheck: Bool = false
    
    // Ensures the top navigation bar is translucent, which makes sure that the table view
    // does not disappear underneath it.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.translucent = false
    }
    
    // Returns how many items are in the current checklist.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentChecklistList.count
    }
    
    // Creates all cells in the table. Changes label text to show item name and
    // colours button depending on whether it has been obtained or not.
    override func tableView(tableView: UITableView,
                            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Uses the custom cell ObtainableCell containing a label to the left and a button on the right.
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItemCell",
                                                               forIndexPath: indexPath) as! ObtainableCell
        // Changes label text to be item name.
        cell.achievementName.text = currentChecklistList[indexPath.row].getItemName()
        // Displays the items icon next to the items name.
        cell.achievementImage.image = UIImage(named: currentChecklistList[indexPath.row].getItemIcon())
        
        // Displays either a checked or unchecked checkbox to the right of the items name.
        if (currentChecklistList[indexPath.row].isCollected()) {
            cell.achievementObtained.image = UIImage(named: ("checked"))
        } else {
            cell.achievementObtained.image = UIImage(named: ("unchecked"))
        }
        
        return cell
    }
    
    // When a row is pressed this segue is carried out which transitions to the next view showing a
    // detailed description of the selected item.
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("ChecklistItemDetailSegue", sender: tableView)
    }
    
    // Sends information to the next controller containing details on the item pressed and a
    // link to the current viewController so that it can be updated when item is obtained.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Creates a link to the next view controller.
        let checkItemViewController = segue.destinationViewController as! ChecklistItemDetailViewController
        
        // Gets the location of the current item.
        let indexPath = self.tableView.indexPathForSelectedRow!
        
        // Gets the currently selected item.
        let sentItem: CollectionItem = currentChecklistList[indexPath.row]
        
        // Sends information to the next view to help with correct display and updating of the
        // selected item.
        checkItemViewController.currentAchievement = currentAchievement as! CollectionAchievement
        checkItemViewController.currentItem = sentItem
        checkItemViewController.previousTabView = self
        checkItemViewController.previousCheckTabView = self.previousCheckTabView
        checkItemViewController.previousAchieveTabView = self.previousAchieveTabView
        checkItemViewController.isPrevViewCheck = self.isPrevViewCheck
    }
}