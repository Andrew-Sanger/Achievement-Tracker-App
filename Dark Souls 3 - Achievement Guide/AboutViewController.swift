//
// AboutViewController.swift
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

// UPDATE
// ------
// This class is the controller for the About tab. It displays information about the
// app and acknowledgements for the images, information and sounds used in it.
//
// The About tab plays a sound when it is entered. This is done using the Cocoa
// class AVFoundation in the Model class.
//
// All information is places into the text fields of the UILabels in the view.
// Information can be changed here.
class AboutViewController: UIViewController {
    // These are the links to the four UILabels used in the view
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var assDetLabel: UILabel?
    @IBOutlet weak var ackLabel: UILabel?
    @IBOutlet weak var ackDetLabel: UILabel?

    override func viewDidLoad() {
        // Plays the "about_screen sound when this view is entered.
        Model.sharedInstance.playInitialSound(Model.SoundToPlay.about_screen)
        
        // Sets the navigation bar to not translucent so that formatting
        // errors with the Scroll area do no occur.
        self.navigationController?.navigationBar.translucent = false
        
        // The following sets all info in the view. The strange formatting
        // is so it is easier to read. Not sure if that is true or not..
        titleLabel?.text =  "Dark Souls III Achievement Guide"
        assDetLabel?.text = "Created by:\n" +
                            "===========\n" +
                            "Andrew Sanger\n" +
                            "s3440468\n\n" +
                            "CPT224 - iPhone Software Engineering\n" +
                            "Assignment 2"
        ackLabel?.text =    "Image Acknowledgements"
        ackDetLabel?.text = "All achievement information, guides, and icons used in " +
            "this app taken from: http://darksouls3.wiki.fextralife.com\n\n" +
                            "Black parchment texture taken from: http://www.photos-p" +
            "ublic-domain.com/2011/03/11/black-parchment-paper-texture/\n\n" +
                            "Intro image of knight taken from: https://wallpaperscra" +
            "ft.com/download/dark_souls_dark_souls_ii_art_game_98201/640x1136\n\n" +
                            "Dark Souls III logo taken from: https://www.gamestop.ie" +
            "/DarkSouls3\n\n" +
                            "Dark Sign image taken from: http://darksouls.wikia.com/" +
            "wiki/Darksign_(Dark_Souls_III)\n\n" +
                            "Dark souls sounds taken from: https://www.reddit.com/r/" +
            "darksouls/comments/t4o61/dark_souls_sounds/\n\n" +
                            "All images, sounds and information used for academic pu" +
            "rposes only. All material is copyright From Software and their " +
            "respective owners."
        
        super.viewDidLoad()
    }
}
