//
//  RegisterGroupViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/23/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit

class RegisterGroupViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var groupNameTextField: UITextField!
    var searchInputText: String?
    var user: User!
    var groups: [Group]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let person = defaults.objectForKey("user") as? NSData {
            self.user = NSKeyedUnarchiver.unarchiveObjectWithData(person) as! User
            userNameLabel.text = "Let's get you registered \(user.first_name!)"
        }
        
        groupNameTextField.delegate = self
        navigationItem.title = "Register Group"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if let text = textField.text {
            searchInputText = text
        }
    }
    
    @IBAction func search(sender: UIButton) {
        if(nil != searchInputText) {
            performSegueWithIdentifier("searchGroups", sender: self)
        }
    }
    
    @IBAction func createNewGroup(sender: UIButton) {
        performSegueWithIdentifier("createGroup", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if("searchGroups" == segue.identifier) {
            let groupSearchResultsVC = segue.destinationViewController as! SearchGroupsViewController
            getGroupsFromAPI()
            groupSearchResultsVC.groups = self.groups
            print(groups![0].name)
        }
    }
    
    func getGroupsFromAPI() {
        groups = [Group(name: "Default Group", image: UIImage(named: "default")!, members: ["John Smith", "Jane Smith", "Jordan Leeper", "Dillon Mulroy", "Andrew Prokop"])]
    }
}