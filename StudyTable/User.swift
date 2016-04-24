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
    var firstName: String?
    var lastName: String?
    var email: String?
    
    init(id: String, firstName: String, lastName: String, email: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
    
    required init?(coder aDecoder: NSCoder) {
        id = (aDecoder.decodeObjectForKey("id") as! String)
        firstName = (aDecoder.decodeObjectForKey("firstName") as! String)
        lastName = (aDecoder.decodeObjectForKey("lastName") as! String)
        email = (aDecoder.decodeObjectForKey("email") as! String)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(firstName, forKey: "firstName")
        aCoder.encodeObject(lastName, forKey: "lastName")
        aCoder.encodeObject(email, forKey: "email")
    }
    
    func asDictionary() -> Dictionary<String, String> {
        return ["id": id!, "firstName": firstName!, "lastName": lastName!, "email": email!]
    }
}
