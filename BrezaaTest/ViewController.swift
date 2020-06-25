//
//  ViewController.swift
//  BrezaaTest
//
//  Created by eren kulan on 25/06/2020.
//  Copyright © 2020 eren kulan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var users = [User]()
    private var apiClient = APIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        getUsers(withAPIClient: apiClient)
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

            }
        })
    }


}

