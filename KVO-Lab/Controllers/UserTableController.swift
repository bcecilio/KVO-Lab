//
//  UserTableController.swift
//  KVO-Lab
//
//  Created by Brendon Cecilio on 4/8/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class UserTableController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var user = [User]() {
        didSet {
            tableView.reloadData()
        }
    }
    private var userNameObserver: NSKeyValueObservation?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        dump(user)
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureUserObservation() {
        userNameObserver = Account.shared.observe(\.userName, options: [.old, .new], changeHandler: { [weak self] (account, change) in
            guard let userNameValue = change.newValue else {return}
            self?.user.first?.userName = userNameValue.
        })
    }
}

extension UserTableController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let userInfo = user[indexPath.row]
        cell.textLabel?.text = userInfo.userName
        cell.detailTextLabel?.text = userInfo.accountBalance.description
        return cell
    }
}
