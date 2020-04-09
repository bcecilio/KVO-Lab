//
//  Account.swift
//  KVO-Lab
//
//  Created by Brendon Cecilio on 4/9/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import Foundation

@objc class Account: NSObject {
    
    static var shared = Account()
    @objc dynamic var userName: String
    @objc dynamic var userBalance: Double
    override private init() {
        userName = " "
        userBalance = 00.00
    }
}
