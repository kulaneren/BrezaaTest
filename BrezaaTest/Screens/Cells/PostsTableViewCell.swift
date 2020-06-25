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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initCell(post: Post) {
        lblPostTitle.text = post.title

        APIClient().getCommentCount(withPostId: post.id) { (count, error) in
            if let error = error as NSError? {
                return
            }
            if let count = count {
                self.lblCommentCount.text = "\(count)"
            }
        }
    }
}
