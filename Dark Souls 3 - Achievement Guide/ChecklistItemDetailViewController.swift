//
// ChecklistItemDetailViewController.swift
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

// This class is the controller for the detail view shown when an item is
// pressed in the checklist view. It is a UIView called Checklist Item Detail
// View Controller Scene.
//
// It shows all information about the currently selected item including its
// name, description, location, person it can be acquired from ,guide and an 
// image (NYI) of the item. It also creates a button at the bottom of the screen 
// that when pressed wil mark it as obtained.
//
// UPDATE
// ------
// This class now removes any description/location or guide labels if there is
// no information in that section of the item. It does this by checking
// to see whether these fields are empty and if they are, then the corresponding
// labels are set to hidden.
//
// The items icon is now displayed, and the obtained button is now either a 
// checked or unchecked checkbox.
//
// A obtained sounds now plays whenever the obtained button is pressed.
//
// Will now refresh statistics tab when achievement is obtained.
class ChecklistItemDetailViewController: UIViewController {
    // Variables containing links to the current achievement, current item. Also
    // ViewControllers holding links to the previous tab and the tabs before that.
    // Also holds a Boolean value to show whether this view was arrived at from
    // the Achievement tab or Checklist tab.
    var currentAchievement: Achievement!
    var currentItem: CollectionItem!
    var previousTabView: ChecklistDetailViewController!
    var previousCheckTabView: ChecklistViewController!
    var previousAchieveTabView: AchievementTableViewController!
    var isPrevViewCheck: Bool = false
    
    // Creates links to all appropriate items in the view.
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDesc: UILabel!
    @IBOutlet weak var itemLoc: UILabel!
    @IBOutlet weak var itemAcq: UILabel!
    @IBOutlet weak var itemGuide: UILabel!
    @IBOutlet weak var itemImage: UIImageView!    
    @IBOutlet weak var obtainedButton: UIButton!
    
    // New links to the hidable labels.
    @IBOutlet weak var descLab: UILabel!
    @IBOutlet weak var locLab: UILabel!
    @IBOutlet weak var guideLab: UILabel!
    
    // Initates the current view depending on the item selected. Also sets up an 
    // "Obtain Item" button which will toggle the item as collected and not.
    override func viewDidLoad() {
        itemName.text = currentItem.getItemName()
        
        // Hides the description label if not needed.
        if currentItem.getItemDesc() == "" {
            itemDesc.hidden = true
            descLab.hidden = true
        } else {
            itemDesc.hidden = false
            descLab.hidden = false
            itemDesc.text = currentItem.getItemDesc()
        }
        
        // Hides the location label if not needed.
        if currentItem.getItemLoc() == "" {
            itemLoc.hidden = true
            locLab.hidden = true
        } else {
            itemLoc.hidden = false
            locLab.hidden = false
            itemLoc.text = currentItem.getItemLoc()
        }
        
        itemAcq.text = currentItem.getItemAcq()
        
        // Hides the guide label if not needed.
        if currentItem.getItemGuide() == "" {
            itemGuide.hidden = true
            guideLab.hidden = true
        } else {
            itemGuide.hidden = false
            guideLab.hidden = false
            itemGuide.text = currentItem.getItemGuide()
        }
        
        // Displays the items image.
        itemImage.image = UIImage(named: currentItem.getItemIcon())
        
        // Sets the button at the bottom of the screen to be either red or
        // green depending on whether it has been collected or not.
        self.setButton()
    }
    
    // When the obtain item button is pressed this function is called, which sets
    // the curret item to obtained. It then checks the current achievement to see
    // if it has been completed, and finally updates the previous 2 table views so
    // that they show updated information.
    @IBAction func obtainButton(sender: UIButton) {
        currentItem.toggleCollected()
        (currentAchievement as! CollectionAchievement).checkIfObtained()
        
        previousTabView.tableView.reloadData()
        Model.sharedInstance.statisticsController?.viewDidLoad()
        
        // Depending on whether the user came from the Achievement tab or the
        // Checklist tab, this will update the appropriate table view.
        if (isPrevViewCheck) {
            self.previousCheckTabView.tableView.reloadData()
        } else {
            self.previousAchieveTabView.tableView.reloadData()
        }
        
        self.setButton()
        // Plays the item_get sound.
        Model.sharedInstance.playInitialSound(Model.SoundToPlay.item_get)
    }
    
    // Updates the button on screen to be either a check or unchecked.
    func setButton() {
        if (currentItem.isCollected()) {
            obtainedButton.setImage(UIImage(named: "checked"), forState: .Normal)
        } else {
            obtainedButton.setImage(UIImage(named: "unchecked"), forState: .Normal)
        }
    }
}