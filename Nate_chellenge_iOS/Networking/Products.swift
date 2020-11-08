//
//  Products.swift
//  Nate_chellenge_iOS
//
//  Created by Kantachat Puagkajee on 08/11/2020.
//

struct Products: Decodable {
    let count: Int
    let all: [Product]
    
    enum CodingKeys: String, CodingKey {
        case count
        case all = "results"
        
    }
}

