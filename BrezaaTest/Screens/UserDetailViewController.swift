//
//  UserDetailViewController.swift
//  BrezaaTest
//
//  Created by eren kulan on 25/06/2020.
//  Copyright © 2020 eren kulan. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var tblPosts: UITableView!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMail: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    var user : User?
    private var posts = [Post]()
    private var apiClient = APIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initScreen()
        
        getPosts(withAPIClient: apiClient)
    }
    
    func initScreen() {
        tblPosts.dataSource = self

        tblPosts.register(UINib(nibName: "PostsTableViewCell", bundle: nil), forCellReuseIdentifier: "PostsTableViewCell")
        tblPosts.estimatedRowHeight = 85.0
        tblPosts.rowHeight = UITableView.automaticDimension
        
        if let user = self.user {
            self.title = user.username
            
            lblName.text = user.name
            lblMail.text = user.email
            lblAddress.text = user.address.city
            
            imgAvatar.setImageWithUserName(userName: user.name)
        }
    }
    
    internal func getPosts(withAPIClient apiClient: APIClient) {
        if let id = user?.id {
            apiClient.getPosts(withUserId: id, withCompletion: { posts, error in
                if let error = error as NSError? {
                    let alertAction = UIAlertAction(title: "Ok",
                                                    style: .default,
                                                    handler: nil)
                    self.showAlert(title: "Error", message: error.localizedDescription, actions: [alertAction])
                    return
                }
                if let posts = posts {
                    self.posts = posts
                    self.tblPosts.reloadData()
                }
            })
        }
    }
}

extension UserDetailViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell") as! PostsTableViewCell
        cell.update(post: post)
        return cell
    }
}
