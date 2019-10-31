//
//  ContactModel.swift
//  iOSContactList
//
//  Created by Sachin Daingade on 31/10/19.
//  Copyright © 2019 Sachin Daingade. All rights reserved.
//

import Foundation

class MyContact{
    var name: String?
    var profile: Data?
    var phoneNumber: String?
    
    init(name: String,profile:Data, phoneNumber:String ) {
        self.name = name
        self.profile = profile
        self.phoneNumber = phoneNumber
    }
    
}


