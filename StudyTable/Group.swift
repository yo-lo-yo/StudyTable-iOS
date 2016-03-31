//
//  Group.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/28/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit

class Group: NSObject, NSCoding {
    
    var name: String
    var image: UIImage
    var members = [String]()
    
    init(name: String, image: UIImage, members: [String]) {
        self.name = name
        self.image = image
        self.members = members
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as! String
        image = aDecoder.decodeObjectForKey("image") as! UIImage
        members = aDecoder.decodeObjectForKey("members") as! [String]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(image, forKey: "image")
        aCoder.encodeObject(members, forKey: "members")
    }

}
