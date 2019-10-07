//
//  Repository.swift
//  gitswift
//
//  Created by Rodrigo Andrade on 06/10/19.
//  Copyright © 2019 Rodrigo Andrade. All rights reserved.
//

struct Repository: Codable {

    var name : String?
    var owner : Owner?
    var description : String?
    var stargazers_count : Int?

}
