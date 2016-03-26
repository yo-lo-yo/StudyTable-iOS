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

    @IBOutlet weak var searchInput: UITextField!
    
    var searchInputText: String?
    
    var userName: String?
    
    var groups = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = "Let's get you registered \(userName!)"
        searchInput.delegate = self
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
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if("createGroup" == segue.identifier) {
            
        } else if("searchGroups" == segue.identifier) {
            let navVC = segue.destinationViewController as! UINavigationController
            navVC.navigationBar.barTintColor = UIColor.orangeColor()
            let groupSearchResultsVC = navVC.topViewController as! GroupSearchResultsViewController
            getGroupsFromAPI()
            groupSearchResultsVC.groups = self.groups
        }
    }
    
    func getGroupsFromAPI() {
        groups += ["group1", "group2", "group3", "group4"]
    }
}