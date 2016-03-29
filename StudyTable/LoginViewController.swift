//
//  ViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/15/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKShareKit
import FBSDKCoreKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var fbButton: FBSDKLoginButton!
    var id = "id"
    var name = "name"
    var group: String = "asd"
    var groupImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fbButton.readPermissions = ["public_profile",  "email", "user_friends"]
        fbButton.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if(nil != FBSDKAccessToken.currentAccessToken()) {
            fbButton.hidden = true
            getFacebookUserData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if(error == nil) {
            getFacebookUserData()
        } else {
            print("Error logging in.")
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        let loginManager: FBSDKLoginManager = FBSDKLoginManager.init()
        loginManager.logOut()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "landingScene") {
            let tabBarVC = segue.destinationViewController as! UITabBarController
            tabBarVC.tabBar.barTintColor = UIColor.lightGrayColor()
            let hoursNavVC = tabBarVC.viewControllers![0] as! UINavigationController
            hoursNavVC.navigationBar.barTintColor = UIColor.lightGrayColor()
            let loggedHoursVC = hoursNavVC.viewControllers[0] as! LoggedHoursViewController
            loggedHoursVC.name = self.name
        } else if(segue.identifier == "registerGroup") {
            let navBarVC = segue.destinationViewController as! UINavigationController
            navBarVC.navigationBar.barTintColor = UIColor.orangeColor()
            let registerGroupVC = navBarVC.topViewController as! RegisterGroupViewController
            registerGroupVC.userName = self.name
        } else {
            print("can't id segue" + segue.identifier!)
        }
    }
    
    func getFacebookUserData() {
        FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields": "id, first_name, last_name, email"]).startWithCompletionHandler { (connection, result, error) -> Void in
            if(error == nil) {
                self.name = (result.objectForKey("first_name") as? String)!
                self.id = (result.objectForKey("id") as? String)!
                self.getUserAccount()
            } else {
                self.name = "Unable to retrieve name"
                self.id = "Unable to retrieve id"
            }
        }
    }
    
    func getUserAccount() {
        //API call to get user data/groups
        //if user == nil, create user
        if(group.isEmpty) {
            self.performSegueWithIdentifier("registerGroup", sender: self)
        } else {
            self.performSegueWithIdentifier("landingScene", sender: self)
        }
    }

}

