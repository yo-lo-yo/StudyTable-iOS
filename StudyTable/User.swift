//
//  User.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/30/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {
    
    var id: String?
    var first_name: String?
    var last_name: String?
    var email: String?
    
    init(id: String, first_name: String, last_name: String, email: String) {
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
    }
    
    required init?(coder aDecoder: NSCoder) {
        id = (aDecoder.decodeObjectForKey("id") as! String)
        first_name = (aDecoder.decodeObjectForKey("first_name") as! String)
        last_name = (aDecoder.decodeObjectForKey("last_name") as! String)
        email = (aDecoder.decodeObjectForKey("email") as! String)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(first_name, forKey: "first_name")
        aCoder.encodeObject(last_name, forKey: "last_name")
        aCoder.encodeObject(email, forKey: "email")
    }
}
