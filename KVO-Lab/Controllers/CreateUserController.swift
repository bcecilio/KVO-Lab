//
//  CreateUserController.swift
//  KVO-Lab
//
//  Created by Brendon Cecilio on 4/8/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class CreateUserController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var balanceTextField: UITextField!
    
//    private var user: User?
//    private var userObserver: NSKeyValueObservation?
//    private var balanceObserver: NSKeyValueObservation?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField()
    }
    
    private func configureTextField() {
        usernameTextField.delegate = self
        balanceTextField.delegate = self
    }
    
    @IBAction func createButtonPressed(_ sender: UIButton) {
        if usernameTextField.text!.isEmpty && balanceTextField.text!.isEmpty {
            showAlert(title: "Error", message: "All fields must be filled")
        } else {
            showAlert(title: "Success", message: "Account Created")
            let user = User()
            guard let name = usernameTextField.text, let balance = balanceTextField.text else {return}
            user.userName = name
            user.accountBalance = Double(balance) ?? 0.0
            Account.shared.userArray.append(user)
        }
    }
}

extension CreateUserController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
    }
}
