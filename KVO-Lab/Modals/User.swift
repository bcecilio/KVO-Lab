//
//  User.swift
//  KVO-Lab
//
//  Created by Brendon Cecilio on 4/8/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import Foundation

@objc class User: NSObject {
    
    @objc dynamic var userName: String = "beanMan"
    @objc dynamic var accountBalance: Double = 00.00
}
