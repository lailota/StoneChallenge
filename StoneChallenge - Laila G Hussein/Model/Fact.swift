//
//  Fact.swift
//  StoneChallenge - Laila G Hussein
//
//  Created by Laila Guzzon Hussein Lailota on 14/07/21.
//

import Foundation

// Create the Fact Structure

struct Fact: Codable {
    var categories: [String?]
    var created_at: String
    var icon_url: String
    var id: String
    var updated_at: String
    var url: String
    var value: String 
    
    
    enum CodingKeys: String, CodingKey {
    
            case categories
            case created_at
            case icon_url
            case id
            case updated_at
            case url
            case value
        }
    
}
//
