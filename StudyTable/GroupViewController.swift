//
//  GroupViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/23/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    var inputGroupName = ""
    var inputGroupImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(!inputGroupName.isEmpty) {
            groupNameLabel.text = inputGroupName
            groupImage.image = inputGroupImage
        }
    }
}
