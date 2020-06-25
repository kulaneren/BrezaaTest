//
//  UIImageView+KingFisher.swift
//  BrezaaTest
//
//  Created by eren kulan on 25/06/2020.
//  Copyright © 2020 eren kulan. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {

    func setImageWithUserName(userName: String) {
        let str = API.AvatarBaseURL + userName.replacingOccurrences(of: " ", with: "%20") + API.FormatPNG
        let url = URL(string: str)
        self.kf.setImage(with: url)
    }
}
