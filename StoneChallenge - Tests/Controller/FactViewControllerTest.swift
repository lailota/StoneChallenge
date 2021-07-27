//
//  FactViewControllerTest.swift
//  StoneChallenge - Tests
//
//  Created by Laila Guzzon Hussein Lailota on 26/07/21.
//

import XCTest
@testable import StoneChallenge___Laila_G_Hussein

class FactViewControllerTest: XCTestCase {
    
    var storyboard: UIStoryboard!
    var sut: FactViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "FactViewController") as FactViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }

    func testFactViewController_WhenCreated_HasRequieredOutsletsNotConnectd() throws {
        
        let mySearchBar = try XCTUnwrap(sut.mySearchBar, "The searchBar is not connected to an IBOutlet")
        let noResultsLabel = try XCTUnwrap(sut.noResultsLabel, "The noResultsLabel is not connected to an IBOutlet")
        let totalResultsLabel = try XCTUnwrap(sut.totalResultsLabel, "The totalResultsLabel is not connected to an IBOutlet")
        
        XCTAssertEqual(mySearchBar.text, "", "SearchBar text field was not empty when the view controller initially loaded")
        XCTAssertEqual(noResultsLabel.text, "No Results", "NoResults label was not correct displayed when the view controller initially loaded")
        XCTAssertEqual(totalResultsLabel.text, "Label", "TotalResults label was not correct displayed when the view controller initially loaded")
    }
    
    
    func testViewController_WhenCreated_HasSearchButtonTappedAndAction() throws {
        // Arrange
        let searchButton: UIBarButtonItem = try XCTUnwrap(sut.searchButton, "Search button does not have a referencing outlet")
        
        // Act
        let searchButtonActions = try XCTUnwrap(searchButton.action, "Search button does not have any actions assigned to it")
        
        // Assert
        XCTAssertEqual(searchButtonActions.hashValue, searchButton.action?.hashValue)
        XCTAssertEqual(searchButtonActions.description, "searchButtonTapped:", "There is no action with a name searchButtonTapped assigned to signup button")
    }
    

}
