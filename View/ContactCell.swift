//
//  ContactCell.swift
//  iOSContactList
//
//  Created by Sachin Daingade on 31/10/19.
//  Copyright © 2019 Sachin Daingade. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var ProfileImageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
