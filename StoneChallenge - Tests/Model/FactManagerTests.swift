//
//  FactManagerTests.swift
//  StoneChallenge - Tests
//
//  Created by Laila Guzzon Hussein Lailota on 26/07/21.
//

import XCTest
@testable import StoneChallenge___Laila_G_Hussein

class FactManagerTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFactViewController_testAPIResponse_whenGetFactsIsCalledWithValidWord() throws {
        let provider = FactsManager()
        let expectation = self.expectation(description: "Search for facts with the word 'flower' and find 6 results.")
        provider.getFacts("flower") { (result) in
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if provider.factsArray.count == 6 {
                expectation.fulfill()
            } else {
                XCTFail("Deveria haver 6 resultados ao invés de \(provider.factsArray.count)")
            }
            
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    
    func testFactViewController_testAPIResponse_whenGetFactsIsCalledWithInvalidWord() throws {
        let provider = FactsManager()
        let expectation = self.expectation(description: "Search for facts with a short word and find 0 results.")
        provider.getFacts("ye") { (result) in
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if provider.factsArray.count == 0 {
                expectation.fulfill()
            } else {
                XCTFail("Successful research")
            }
            
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
}
