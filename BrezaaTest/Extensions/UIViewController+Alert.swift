//
//  UIViewController+Alert.swift
//  BrezaaTest
//
//  Created by eren kulan on 25/06/2020.
//  Copyright © 2020 eren kulan. All rights reserved.
//

import UIKit

extension UIViewController {

    func showAlert(title: String?,
                   message: String?,
                   actions: [UIAlertAction]) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        for alertAction in actions {
            alertController.addAction(alertAction)
        }
        present(alertController, animated: true, completion: nil)
    }

}
