//
//  CreateGroupViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/30/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit

class CreateGroupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var groupNameTextField: UITextField!
    
    var groupName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupNameTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func createGroupPressed(sender: UIButton) {
        if let groupName = groupName {
            if validateGroupName(groupName) {
                createGroup()
                performSegueWithIdentifier("landingScene", sender: self)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let landingStoryBoard = UIStoryboard.init(name: "Landing", bundle: nil)
        let tabBarVC = landingStoryBoard.instantiateInitialViewController() as! UITabBarController
        tabBarVC.tabBar.barTintColor = UIColor.lightGrayColor()
        let hoursNavVC = tabBarVC.viewControllers![0] as! UINavigationController
        hoursNavVC.navigationBar.barTintColor = UIColor.lightGrayColor()
        let window: UIWindow = UIApplication.sharedApplication().keyWindow!
        window.rootViewController = tabBarVC
        window.makeKeyAndVisible()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if let text = textField.text {
            groupName = text
        }
    }
    
    func validateGroupName(name: String) -> Bool {
        //API call to check for same named groups
        return true
    }
    
    func createGroup() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
