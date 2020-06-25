//
//  ViewController.swift
//  BrezaaTest
//
//  Created by eren kulan on 25/06/2020.
//  Copyright © 2020 eren kulan. All rights reserved.
//

import UIKit

class UsersTableViewController: UIViewController {

    @IBOutlet weak var tblUsers: UITableView!

    private var users = [User]()
    private var selectedUser: User?
    private var apiClient = APIClient()

    override func viewDidLoad() {
        super.viewDidLoad()

        initTableView()
        getUsers(withAPIClient: apiClient)
    }

    func initTableView() {
        tblUsers.delegate = self
        tblUsers.dataSource = self

        tblUsers.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        tblUsers.estimatedRowHeight = 85.0
        tblUsers.rowHeight = UITableView.automaticDimension
    }

    internal func getUsers(withAPIClient apiClient: APIClient) {
        apiClient.getUsers(withCompletion: { users, error in
            if let error = error as NSError? {
                let alertAction = UIAlertAction(title: "Ok",
                                                style: .default,
                                                handler: nil)
                self.showAlert(title: "Error", message: error.localizedDescription, actions: [alertAction])
                return
            }
            if let users = users {
                self.users = users
                self.tblUsers.reloadData()
            }
        })
    }
}

extension UsersTableViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showUserDetail", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! UserDetailViewController

        if let indexPath = tblUsers.indexPathForSelectedRow {
            destinationVC.user = users[indexPath.row]
        }
    }
}

extension UsersTableViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        cell.update(user: user)
        return cell
    }
}
