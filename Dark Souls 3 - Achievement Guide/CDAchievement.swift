//
// CDAchievement.swift
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
import CoreData

// This clsas implements the NSManagedObject class from CoreData to hold all relevant
// retrieved data from CoreData. This object is held in the Achievement object.
class CDAchievement: NSManagedObject {
    @NSManaged var achNumber: Int16
    @NSManaged var achName: String
    @NSManaged var achScore: Int16
    @NSManaged var achDesc: String
    @NSManaged var achGuide: String
    @NSManaged var isCollection: Bool
    @NSManaged var isObtained: Bool
    @NSManaged var achIcon: String
}
