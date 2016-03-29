//
//  Group.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/28/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit

class Group {
    
    var name: String
    var image: UIImage
    var members = [String]()
    
    init(name: String, image: UIImage, members: [String]) {
        self.name = name
        self.image = image
        self.members = members
    }

}
