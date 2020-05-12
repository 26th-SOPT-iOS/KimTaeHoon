//
//  friendTableViewCell.swift
//  SecondWeek
//
//  Created by 김태훈 on 2020/05/12.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit

class friendTableViewCell: UITableViewCell {
    static let identifier: String = "friendTableViewCell"
    @IBOutlet weak var FriendMassageLabel: UILabel!
    @IBOutlet weak var FriendNameLabel: UILabel!
    @IBOutlet weak var FriendProfileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setFriendInformation(profileImageName:String,name:String,message:String){
        FriendProfileImage.image=UIImage(named: profileImageName)
        FriendNameLabel.text=name
        FriendMassageLabel.text=message
    }
}
