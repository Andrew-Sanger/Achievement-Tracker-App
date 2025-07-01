//
// Dark_Souls_3___Achievement_GuideUITests.swift
//
// iPhone Software Engineering - SP2 2016
// --------------------------------------
// Assignment 1 - Milestone 2
// Dark Souls 3 - Achievement Guide
//
// Created by Andrew Sanger on 17/07/2016.
// Copyright © 2016 Andrew Sanger. All rights reserved.
//

import XCTest

// Please see included PDF for details on these tests.
//
// These tests all run without problems when done individually. Nothing changes in
// the program but sometimes they just wont work. For some reason it wont press the
// achievement button. But then in the next run it will. Im not sure why it does it 
// sometimes and not all the time.
class Dark_Souls_3___Achievement_GuideUITests: XCTestCase {
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        XCUIApplication().launch()
    }
    
    func testButtonNavigation() {
        let app = XCUIApplication()
        app.buttons["Achievements"].tap()
        let darkSoulsIiiButton = app.navigationBars["Dark_Souls_3___Achievement_Guide.TabBarView"].buttons["Dark Souls III"]
        darkSoulsIiiButton.tap()
        app.buttons["Checklists"].tap()
        darkSoulsIiiButton.tap()
        app.buttons["Statistics"].tap()
        darkSoulsIiiButton.tap()
        app.buttons["Dark Souls News"].tap()
        darkSoulsIiiButton.tap()
    }
    
    func testCorrectNumberOfCells() {
        let app = XCUIApplication()
        app.buttons["Achievements"].tap()
        XCTAssertEqual(app.cells.count, 43)
        let tablesQuery = app.tables
        tablesQuery.cells.containingType(.StaticText, identifier:"Master of Expression").childrenMatchingType(.StaticText).matchingIdentifier("Master of Expression").elementBoundByIndex(0).tap()
        app.buttons["Checklist"].tap()
        XCTAssertEqual(app.cells.count, 33)
        app.navigationBars["Dark_Souls_3___Achievement_Guide.ChecklistDetailView"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0).tap()
        app.navigationBars["Dark_Souls_3___Achievement_Guide.AchievementDetailView"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0).tap()
        app.navigationBars["Dark_Souls_3___Achievement_Guide.TabBarView"].buttons["Dark Souls III"].tap()
        app.buttons["Checklists"].tap()
        XCTAssertEqual(app.cells.count, 6)
    }
    
    func testCorrectButtonsDisplayed() {
        let app = XCUIApplication()
        app.buttons["Achievements"].tap()
        let tablesQuery = app.tables
        tablesQuery.cells.containingType(.StaticText, identifier:"Ultimate Bonfire").childrenMatchingType(.StaticText).matchingIdentifier("Ultimate Bonfire").elementBoundByIndex(0).tap()
        XCTAssertEqual(app.buttons["Button"].hittable, true)
        let backButton = app.navigationBars["Dark_Souls_3___Achievement_Guide.AchievementDetailView"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0)
        backButton.tap()
        let masterOfExpressionStaticText = tablesQuery.staticTexts["Master of Expression"]
        masterOfExpressionStaticText.tap()
        let checklistButton = app.buttons["Checklist"]
        checklistButton.tap()
        tablesQuery.staticTexts["Point Forward"].tap()
        XCTAssertEqual(app.buttons["Button"].hittable, true)
    }
    
    func testCorrectTextIsDisplayed() {
        let app = XCUIApplication()
        app.buttons["Achievements"].tap()
        app.tables.staticTexts["Ultimate Bonfire"].tap()
        XCTAssert(app.staticTexts["Ultimate Bonfire"].exists)
        XCTAssert(app.staticTexts["30 points"].exists)
        XCTAssert(app.staticTexts["Reinforce a bonfire to the highest level."].exists)        
    }
}
