//
//  UserTableViewCell.swift
//  BrezaaTest
//
//  Created by eren kulan on 25/06/2020.
//  Copyright © 2020 eren kulan. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!

    func update(user: User) {
        lblUserName.text = user.username
        imgAvatar.setImageWithUserName(userName: user.name)
    } 
}
