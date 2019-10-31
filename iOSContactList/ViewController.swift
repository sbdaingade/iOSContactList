//
//  ViewController.swift
//  iOSContactList
//
//  Created by Sachin Daingade on 31/10/19.
//  Copyright © 2019 Sachin Daingade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var arrContacts = [ContactViewModel]()///AirportViewModel
    
    @IBOutlet weak var tblContacts: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ServiceManager.sharedContact.getAllContacts { result, err in
            if let err = err {
                print("Fail to access contacts",err.localizedDescription)
                return
            }
            self.arrContacts = result?.map({ return ContactViewModel(myContact:$0 )}) ?? []
            DispatchQueue.main.async {
                self.tblContacts.reloadData()
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ContactCell = self.tblContacts.dequeueReusableCell(withIdentifier: "cell") as! ContactCell
        cell.selectionStyle = .none
        let mvmBindData = self.arrContacts[indexPath.row]
        
        cell.lblName?.text = mvmBindData.name
        cell.lblPhoneNumber?.text = mvmBindData.phoneNumber
        cell.ProfileImageView.image = UIImage(data: mvmBindData.profile!)
        return cell
    }
 
}

