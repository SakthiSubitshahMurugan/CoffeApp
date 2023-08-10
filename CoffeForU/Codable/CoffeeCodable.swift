//
//  CoffeeCodable.swift
//  CoffeForU
//
//  Created by Sakthi Subitshah Murugan on 8/9/23.
//

import Foundation

struct CoffeeCodable:Codable{
    var title:String?
    var description:String?
    var ingredients:[String]?
    var image:String?
    
    enum CodingKeys: String,CodingKey{
        case title = "title"
        case description = "description"
        case ingredients = "ingredients"
        case image = "image"
        
    }
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        title = try value.decodeIfPresent(String.self, forKey:.title)
        description = try value.decodeIfPresent(String.self, forKey:.description)
        ingredients = try value.decodeIfPresent([String].self, forKey:.ingredients)
        image = try value.decodeIfPresent(String.self, forKey:.image)
    }
    
}

