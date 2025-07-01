//
// CDCollectionItem.swift
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
// retrieved data from CoreData. This object is held in the CollectionItem object.
class CDCollectionItem: NSManagedObject {
    @NSManaged var belongsTo: Int16
    @NSManaged var itemName: String
    @NSManaged var itemDesc: String
    @NSManaged var itemLoc: String
    @NSManaged var itemAcqFrom: String
    @NSManaged var itemGuide: String
    @NSManaged var isCollected: Bool
    @NSManaged var itemIcon: String    
}
