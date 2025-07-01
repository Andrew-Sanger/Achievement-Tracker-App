//
// TabBarViewController.swift
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

// This class is the Controler for the UITabBar called UI Tab Bar View
// Controller, which changes the initial tab to be displayed when segueing 
// from the previous view.
class TabBarViewController: UITabBarController {
    // Contains information sent from previous view to help display correct
    // tab.
    var tabToOpen: Int!
    
    // When the view is first displayed, changes the initial tab so that
    // it correct based on which button was pressed in previous view.
    override func viewDidLoad() {
        if (self.tabToOpen != 0) {
            self.selectedIndex = self.tabToOpen - 1
            
            self.tabToOpen = 0
        }
        
        super.viewDidLoad()
    }
}
