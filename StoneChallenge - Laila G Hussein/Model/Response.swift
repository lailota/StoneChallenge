//
//  Response.swift
//  StoneChallenge - Laila G Hussein
//
//  Created by Laila Guzzon Hussein Lailota on 14/07/21.
//

import Foundation

// Create the Response Structure

struct Response: Codable {
    
    var total: Int
    var result: [Fact]
    
    enum CodingKeys: String, CodingKey {
        case total
        case result
    }
    
}

