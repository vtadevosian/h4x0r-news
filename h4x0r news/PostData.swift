//
//  PostData.swift
//  h4xor news
//
//  Created by Vahram Tadevosian on 6/24/20.
//  Copyright © 2020 Vahram Tadevosian. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String { return objectID }
    
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
