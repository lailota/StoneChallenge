//
//  DisplayFactTableViewCellTest.swift
//  StoneChallenge - Tests
//
//  Created by Laila Guzzon Hussein Lailota on 26/07/21.
//

import XCTest
@testable import StoneChallenge___Laila_G_Hussein

class DisplayFactTableViewCellTest: XCTestCase {

    var nib: UINib!
    var sut: DisplayFactTableViewCell!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        nib = UINib(nibName: "DisplayFactTableViewCell", bundle: nil)
        sut = nib.instantiate(withOwner: DisplayFactTableViewCell.self, options: nil)[0] as? DisplayFactTableViewCell
            
    }
    
    override func tearDownWithError() throws {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
            sut = nil
            nib = nil
        }
    
    func testDisplayFactTableViewCell_WhenCreated_HasRequieredOutsletsNotConnectd() throws {
    
            let factLabel = try XCTUnwrap(sut.categoryLabel, "The factLabel is not connected to an IBOutlet")
            let categoryLabel = try XCTUnwrap(sut.categoryLabel, "The categoryLabel is not connected to an IBOutlet")
    
            XCTAssertEqual(factLabel.text, "Label", "factLabel was not empty when the view controller initially loaded")
            XCTAssertEqual(categoryLabel.text, "Label", "categoryLabel was not correct displayed when the view controller initially loaded")
    
        }
    
    func testDisplayFactTableViewCell_WhenCreated_HasShareButtonAndAction() throws {
        // Arrange
        let shareButton: UIButton = try XCTUnwrap(sut.shareButton, "Share button does not have a referencing outlet")
        
        // Act
        let shareButtonActions = try XCTUnwrap(shareButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Share button does not have any actions assigned to it")
        
        // Assert
        XCTAssertEqual(shareButtonActions.count, 1)
        XCTAssertEqual(shareButtonActions.first, "shareButtonTapped:", "There is no action with a name shareButtonTapped assigned to signup button")
    }
    
}
