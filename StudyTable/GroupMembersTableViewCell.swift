//
//  GroupMembersTableViewCell.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/28/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit

class GroupMembersTableViewCell: UITableViewCell {

    @IBOutlet weak var groupMembersNames: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
