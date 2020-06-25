//
//  Post.swift
//  BrezaaTest
//
//  Created by eren kulan on 25/06/2020.
//  Copyright © 2020 eren kulan. All rights reserved.
//

import Foundation

struct Post: Decodable {

    var id: Int
    var userId: Int
    var title: String
    var body: String
}
