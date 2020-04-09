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
    
    private var user: User?
    private var userBalance: User?

    override func viewDidLoad() {
        super.viewDidLoad()

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
        }
    }
    
}

extension CreateUserController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        user?.userName = textField.text ?? "no userName"
    }
}
