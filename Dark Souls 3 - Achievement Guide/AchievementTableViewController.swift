//
// AchievmentTableViewController.swift
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

// This class is the controller for the 1st tab of the app called Achievements.
// It is a UITableView called Achievement List Scene.
//
// It shows a table containing the names of all Achievements, and a button which
// is red when the achievement has not been obtained and green when obtained. When
// a table row is pressed it will segue to the next view which contains a detailed 
// view of the achievement.
//
// UPDATE
// ------
// This class has been updated to allow the achievement image to be displayed to the
// left of the name, and the achievement complete button is replaced with an actual
// image instead of a green/red box.
class AchievementTableViewController: UITableViewController {
    // Contains a link to the Achievements in the model.
    let achievementList: [Achievement] = Model.sharedInstance.getAllAchievements()

    // Ensures the top navigation bar is translucent, which makes sure that the table view
    // does not disappear underneath it.
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.translucent = false
    }

    // Returns how many achievements in the achievementList.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievementList.count
    }

    // Creates all cells in the table. Changes label text to show achievement name and
    // colours button depending on whether it has been obtained or not.
    override func tableView(tableView: UITableView,
                            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Uses the custom cell ObtainableCell containing a label to the left and a button on the right.
        let cell = tableView.dequeueReusableCellWithIdentifier("AchievementCell",
                                                               forIndexPath: indexPath) as! ObtainableCell
        // Changes label text to be achievement name.
        cell.achievementName.text = achievementList[indexPath.row].getAchName()
        // Puts achievement icon next to name.
        cell.achievementImage.image = UIImage(named: achievementList[indexPath.row].getAchIcon())
        
        // Changes the right hand button to show either a checked box or unchecked box depending on 
        // if achievement has been gotten.
        if (achievementList[indexPath.row].isObtained()) {
            cell.achievementObtained.image = UIImage(named: ("checked"))
        } else {
            cell.achievementObtained.image = UIImage(named: ("unchecked"))
        }
        
        return cell
    }
    
    // When a row is pressed, this segue is carried out which moves to the next view showing achievement
    // details.
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("AchievementDetailSegue", sender: tableView)
    }
    
    // Sends information to the next controller containing details on the achievement pressed and a
    // link to the current viewController so that it can be updated when achievement is obtained.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Creates a link to the next view controller.
        let achViewController = segue.destinationViewController as! AchievementDetailViewController
        
        // Gets location of selected achievement in array.
        let indexPath = self.tableView.indexPathForSelectedRow!
        
        // Gets selected achievement.
        let sentAchievement : Achievement = achievementList[indexPath.row]
        
        // Sends information to next view to help display achievement information.
        achViewController.currentAchievement = sentAchievement
        achViewController.previousTabView = self
    }
}
