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
        if nil != groupName {
            performSegueWithIdentifier("landingScene", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let tabBarVC = segue.destinationViewController as! UITabBarController
        tabBarVC.tabBar.barTintColor = UIColor.lightGrayColor()
        tabBarVC.navigationItem.setHidesBackButton(true, animated: true)
        let hoursNavVC = tabBarVC.viewControllers![0] as! UINavigationController
        hoursNavVC.navigationBar.barTintColor = UIColor.lightGrayColor()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if let text = textField.text {
            groupName = text
        }
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
