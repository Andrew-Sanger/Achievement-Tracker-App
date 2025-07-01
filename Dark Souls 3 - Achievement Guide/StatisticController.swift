//
// StatisticController.swift
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

// This Controller displays a bar graph showing the completion as a percentage of 
// all achievements and the individual collection achievements.
class StatisticController: UIViewController {
    // Holds links to the constraints used to change the size of the bar graphs,
    // and links to the labels that show the percentage as a number.
    @IBOutlet weak var achConstraint: NSLayoutConstraint!
    @IBOutlet weak var achPercent: UILabel!
    @IBOutlet weak var infConstraint: NSLayoutConstraint!
    @IBOutlet weak var infPercent: UILabel!
    @IBOutlet weak var sorConstraint: NSLayoutConstraint!
    @IBOutlet weak var sorPercent: UILabel!
    @IBOutlet weak var pyrConstraint: NSLayoutConstraint!
    @IBOutlet weak var pyrPercent: UILabel!
    @IBOutlet weak var mirConstraint: NSLayoutConstraint!
    @IBOutlet weak var mirPercent: UILabel!
    @IBOutlet weak var rinConstraint: NSLayoutConstraint!
    @IBOutlet weak var rinPercent: UILabel!
    @IBOutlet weak var expConstraint: NSLayoutConstraint!
    @IBOutlet weak var expPercent: UILabel!
    
    // Holds a reference to the Model instance
    let modelReference: Model = Model.sharedInstance
    // CGFloat used to ensure correct width formatting.
    var finalWidth: CGFloat = 0
    
    // Set the statistics controller reference in the Model instance to ensure
    // other tabs can refresh this view, when they are updated. Then resizes progress
    // bars to their correct size, and finally updates the percentages displayed on
    // screen.
    override func viewDidLoad() {
        modelReference.statisticsController = self
        resizeProgressBars(UIScreen.mainScreen().bounds.width)
        updatePercentages()
        
        super.viewDidLoad()
    }
    
    // When the phone is rotated, this function ensures the bar charts are updated
    // with the correct phone width. Had to include an if statement because
    // this function was getting called from other tabs before the view was
    // being initialized, causing a crash.
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator
        coordinator: UIViewControllerTransitionCoordinator) {
        if achConstraint != nil {
            resizeProgressBars(size.width)
            updatePercentages()
        }
    }
    
    // This function updates all bar graph sizes so they are the correct size. First
    // it calls a Model function to get the percentage of achievements/items
    // obtained, and then resizes the bar graphs. The max size of the bar graph at
    // 100% is the width of the screen less 8 pixels on either side.
    func resizeProgressBars(maxWidth: CGFloat) {
        finalWidth = maxWidth - 16
        
        achConstraint.constant = ((finalWidth / 100) *
            CGFloat(modelReference.returnPercentageComplete()))
        infConstraint.constant = getBarSize(CollectionAchievement.CollectionType.Infusion)
        sorConstraint.constant = getBarSize(CollectionAchievement.CollectionType.Sorceries)
        pyrConstraint.constant = getBarSize(CollectionAchievement.CollectionType.Pyromancies)
        mirConstraint.constant = getBarSize(CollectionAchievement.CollectionType.Miracles)
        rinConstraint.constant = getBarSize(CollectionAchievement.CollectionType.Rings)
        expConstraint.constant = getBarSize(CollectionAchievement.CollectionType.Expression)
    }
    
    // This function works out the correct width of the bar graph.
    func getBarSize(type: CollectionAchievement.CollectionType) -> CGFloat {
        return ((finalWidth / 100) * CGFloat(modelReference.returnCollectionPercentage(type)))
    }
    
    // This function updates all percentages on screen so they are correct. It calls a model
    // function to get the correct percentage and then sets the UILabel text to the correct
    // amount.
    func updatePercentages() {
        achPercent.text = "\(Int(modelReference.returnPercentageComplete()))%"
        infPercent.text = getCollPerc(CollectionAchievement.CollectionType.Infusion)
        sorPercent.text = getCollPerc(CollectionAchievement.CollectionType.Sorceries)
        pyrPercent.text = getCollPerc(CollectionAchievement.CollectionType.Pyromancies)
        mirPercent.text = getCollPerc(CollectionAchievement.CollectionType.Miracles)
        rinPercent.text = getCollPerc(CollectionAchievement.CollectionType.Rings)
        expPercent.text = getCollPerc(CollectionAchievement.CollectionType.Expression)
    }
    
    // This function works out the correct percentage string to display.
    func getCollPerc(type: CollectionAchievement.CollectionType) -> String {
        return "\(Int(modelReference.returnCollectionPercentage(type)))%"
    }
}