//
//  RegisterGroupViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/23/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit
import Firebase

class RegisterGroupViewController: UIViewController, UITextFieldDelegate {
    
    private let ref = Firebase(url: Constants.firebaseRootURL)
    
    @IBOutlet weak var searchField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Register Group"
    }
    
    @IBAction func search(sender: UIButton) {
        if let searchText = searchField.text  {
            ref.childByAppendingPath("groups/").queryOrderedByChild("groupName").observeSingleEventOfType(.Value, withBlock: { (data) in
                let groupNames = data.value.valueForKey("groupName") as? Array<String>
                for group in groupNames! {
                    if group.lowercaseString.rangeOfString(searchText) != nil {
                        print(group)
                    }
                }
            })
        }
        //performSegueWithIdentifier("searchGroups", sender: self)
    }
    
    @IBAction func createNewGroup(sender: UIButton) {
        performSegueWithIdentifier("createGroup", sender: self)
    }
    
}