//
//  User.swift
//  BrezaaTest
//
//  Created by eren kulan on 25/06/2020.
//  Copyright © 2020 eren kulan. All rights reserved.
//

import Foundation


struct User: Decodable {

    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
}

struct Address: Decodable {

    var street: String
    var suite: String
    var city: String
    var zipcode: String
}

struct Company: Decodable {
    var name: String
    var catchPhrase: String
    var bs: String
}
