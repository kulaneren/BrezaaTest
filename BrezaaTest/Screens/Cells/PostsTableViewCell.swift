//
//  PostsTableViewCell.swift
//  BrezaaTest
//
//  Created by eren kulan on 25/06/2020.
//  Copyright © 2020 eren kulan. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblPostTitle: UILabel!
    @IBOutlet weak var lblCommentCount: UILabel!

    func update(post: Post) {
        lblPostTitle.text = post.title

        APIClient().getCommentCount(withPostId: post.id) { (count, error) in
            if let error = error {
                self.lblCommentCount.text = "-"
                print("Received error on getCommentCount: \(String(describing: error))")
            }
            if let count = count {
                self.lblCommentCount.text = "\(count)"
            }
        }
    }
}
