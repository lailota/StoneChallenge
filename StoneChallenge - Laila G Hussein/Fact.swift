//
//  Fact.swift
//  StoneChallenge - Laila G Hussein
//
//  Created by Laila Guzzon Hussein Lailota on 14/07/21.
//

import Foundation

//struct Facts : Decodable {
//
//    var categories: [String] = []
//    var created_at = Date()
//    var icon_url = ""
//    var id = ""
//    var updated_at = Date()
//    var url = ""
//    var value = ""
//
//    enum CodingKeys: String, CodingKey {
//
//        case categories
//        case created_at
//        case icon_url
//        case id
//        case updated_at
//        case url
//        case value
//
//
//    }
//
//    init (from decoder: Decoder) throws {
//
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let categoriesContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .categories)
//
//        // Parse title, description e publish date
//        self.created_at = try categoriesContainer.decode(Date.self, forKey: .created_at)
//        self.icon_url = try categoriesContainer.decode(String.self, forKey: .icon_url)
//        self.id = try categoriesContainer.decode(String.self, forKey: .id)
//        self.updated_at = try categoriesContainer.decode(Date.self, forKey: .updated_at)
//        self.url = try categoriesContainer.decode(String.self, forKey: .url)
//        self.value = try categoriesContainer.decode(String.self, forKey: .value)
//
//    }
//}

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
