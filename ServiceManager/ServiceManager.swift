//
//  ServiceManager.swift
//  iOSContactList
//
//  Created by Sachin Daingade on 31/10/19.
//  Copyright © 2019 Sachin Daingade. All rights reserved.
//

import Foundation
import Contacts

final class ServiceManager{
    
    static let sharedContact = ServiceManager()
    
    func getAllContacts(complitionHandler:@escaping ([MyContact]?, Error? )-> Void)
    {
        let store = CNContactStore()
        
        store.requestAccess(for: .contacts) { (granted, err) in
            
            if let err = err {
            print("Fail to access contacts",err.localizedDescription)
                complitionHandler(nil,err)
                return
            }
        
            if granted
            {
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey,CNContactPhoneNumbersKey,CNContactImageDataKey]
                let defaultImg = Data()
                let contactRequest = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                var contactList = [MyContact]()
                do{
                    try store.enumerateContacts(with: contactRequest, usingBlock: { (contact, stopIfWant) in
                        print(" \(contact.givenName)")
                        let givenName = contact.givenName + " " + contact.familyName
                        let phone = contact.phoneNumbers.first?.value.stringValue ?? ""
                        let img = contact.imageData ?? defaultImg
                        contactList.append(MyContact(name: givenName, profile: img, phoneNumber: phone))
                        
                    })
                   // print(contactList)
                     complitionHandler(contactList,nil)
                }catch let err{
                    print("Fail to load....",err)
                     complitionHandler(nil,err)
                }
            }else
            {
                 print("Access denied...")
                
            }
            
        }
        
        
    }
    
    
}
