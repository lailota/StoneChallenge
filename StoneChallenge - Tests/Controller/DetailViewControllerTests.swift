//
//  DetailViewControllerTests.swift
//  StoneChallenge - Tests
//
//  Created by Laila Guzzon Hussein Lailota on 26/07/21.
//

import XCTest
@testable import StoneChallenge___Laila_G_Hussein

class DetailViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: DetailViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "DetailViewController") as DetailViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }

    func testFactViewController_WhenCreated_HasRequieredOutsletsNotConnectd() throws {
        
        let factTextView = try XCTUnwrap(sut.factTextView, "The factTextView is not connected to an IBOutlet")
        let gifImage = try XCTUnwrap(sut.gifImage, "The noResultsLabel is not connected to an IBOutlet")
        
        XCTAssertEqual(factTextView.text, "", "factTextView text field was not empty when the view controller initially loaded")
        XCTAssertEqual(gifImage.image, nil, "gifImage was not correct displayed when the view controller initially loaded")
    }
    
    
    func testViewController_WhenCreated_HasShareButtonTappedAndAction() throws {
        // Arrange
        let shareButton: UIBarButtonItem = try XCTUnwrap(sut.shareButton, "Share button does not have a referencing outlet")
        
        // Act
        let shareButtonActions = try XCTUnwrap(shareButton.action, "Share button does not have any actions assigned to it")
        
        // Assert
        XCTAssertEqual(shareButtonActions.hashValue, shareButton.action?.hashValue)
        XCTAssertEqual(shareButtonActions.description, "shareButtonTapped:", "There is no action with a name shareButtonTapped assigned to signup button")
    }
    

}
