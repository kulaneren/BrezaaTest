//
//  Comment.swift
//  BrezaaTest
//
//  Created by eren kulan on 25/06/2020.
//  Copyright © 2020 eren kulan. All rights reserved.
//

import Foundation

struct Comment: Decodable {

    var id: Int
    var postId: Int
    var name: String
    var email: String
    var body: String
}
