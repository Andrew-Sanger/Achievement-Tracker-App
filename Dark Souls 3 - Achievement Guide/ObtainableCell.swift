//
// ObtainableCell.swift
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
import UIKit

// This class creates a custom UITableViewCell containing a UILabel and a
// UIButton. When used in a UITableView, will display the achievement/item
// name and a button that changes colour from red to green when it is completed.
//
// This is not the final state of this cell, in future iterations of the app
// the Button will be replaces with an image, most likely a tickbox.
//
// UPDATE
// ------
// This class has been updated to hold a reference to an image, which is held
// to the left of the item name in the view.
class ObtainableCell: UITableViewCell {
    // These variable names say achievement but can be used for CollectionItems too
    @IBOutlet weak var achievementName: UILabel!
    @IBOutlet weak var achievementObtained: UIImageView!
    @IBOutlet weak var achievementImage: UIImageView!
}
