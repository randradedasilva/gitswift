//
//  RepositoriesResponse.swift
//  gitswift
//
//  Created by Rodrigo Andrade on 06/10/19.
//  Copyright © 2019 Rodrigo Andrade. All rights reserved.
//

struct RepositoriesResponse: Codable {
    
    let items: [Repository]?

    enum CodingKeys: String, CodingKey {
        case items
    }
}
