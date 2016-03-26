//
//  GroupTableViewCell.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/25/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet weak var groupNameLabel: UILabel!
    
    @IBOutlet weak var groupImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
