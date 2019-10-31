//
//  ContactViewModel.swift
//  iOSContactList
//
//  Created by Sachin Daingade on 31/10/19.
//  Copyright © 2019 Sachin Daingade. All rights reserved.
//

import Foundation
class ContactViewModel: NSObject{
    
    var name: String?
    var profile: Data?
    var phoneNumber: String?
    
    init(myContact:MyContact) {
        
        self.name = myContact.name
        self.profile = myContact.profile
        self.phoneNumber = myContact.phoneNumber
    }
    
    
}
