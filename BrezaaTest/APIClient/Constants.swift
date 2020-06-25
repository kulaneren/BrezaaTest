//
//  Constants.swift
//  BrezaaTest
//
//  Created by eren kulan on 25/06/2020.
//  Copyright © 2020 eren kulan. All rights reserved.
//

import Foundation

enum API {
    static let BaseURL = "https://jsonplaceholder.typicode.com/"
    static let UserURLExtension = "users"

    static let AvatarBaseURL = "https://api.adorable.io/avatars/120/"
    static let FormatPNG = ".png"
}

enum Timeout {
    static let IntervalForRequest = 10.0
    static let IntervalForResource = 10.0
}
