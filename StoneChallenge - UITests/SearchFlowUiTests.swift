//
//  SearchFlowUiTests.swift
//  StoneChallenge - UITests
//
//  Created by Laila Guzzon Hussein Lailota on 26/07/21.
//

import XCTest

class SearchFlowUiTests: XCTestCase {
    
    private var app: XCUIApplication!
    private var search: XCUIElement!
    private var tableView: XCUIElementQuery!
    private var noResults: XCUIElement!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        app = XCUIApplication()
        app.launch()
        
        search = app.searchFields["mySearchBar"]
        tableView = app.tables.cells
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        search = nil
        tableView = nil
    }
    
    
    func testSearchFlowUiTests_successfulSearching_whenSearchButtonPressed() throws {
        if search.exists {
            search.tap()
            search.typeText("roma\n")
            XCTAssertEqual(tableView.element(boundBy: 7).waitForExistence(timeout: 5), true, "8º result does not exist")
            XCTAssertEqual(tableView.count, 8, "There should be 8 results for the search")
        }
    }
    
    func testSearchFlowUiTests_unsuccessfulSearching_whenSearchButtonPressed() throws {
   
        if search.exists {
            search.tap()
            search.typeText("ye")
            XCTAssertEqual(noResults.description, "No Results", "NoResults label was not correct displayed when the view controller initially loaded")
            XCTAssertEqual(tableView.count, 0, "There should be 0 results for the search")
        }
    }
    
    func testSearchFlowUiTests_shareSheet_whenShareButtonPressed() throws {
        let messageButton = app.collectionViews.cells["Messages"].children(matching: .other).element
        
        if search.exists {
        search.tap()
        search.typeText("red\n")
        XCTAssertEqual(tableView.element(boundBy: 0).waitForExistence(timeout: 5), true, "The search was not succeeded")
        tableView.element(boundBy: 0).images["Share"].tap()
        XCTAssertEqual(messageButton.exists, true, "A share sheet should be present")
        }
    }
    
    
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
