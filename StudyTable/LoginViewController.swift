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
    let defaults = NSUserDefaults.standardUserDefaults()
    var user: User?
    var groups: [Group]?
    
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
            let landingStoryBoard = UIStoryboard.init(name: "Landing", bundle: nil)
            let tabBarVC = landingStoryBoard.instantiateInitialViewController() as! UITabBarController
            tabBarVC.tabBar.barTintColor = UIColor.lightGrayColor()
            let hoursNavVC = tabBarVC.viewControllers![0] as! UINavigationController
            hoursNavVC.navigationBar.barTintColor = UIColor.lightGrayColor()
        } else if(segue.identifier == "registerGroup") {
        
        } else {
            print("can't id segue" + segue.identifier!)
        }
    }
    
    func getFacebookUserData() {
        FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields": "id, first_name, last_name, email"]).startWithCompletionHandler { (connection, result, error) -> Void in
            if(error == nil) {
                let firstName = (result.objectForKey("first_name") as! String)
                let lastName = (result.objectForKey("last_name") as! String)
                let id = (result.objectForKey("id") as! String)
                let email = (result.objectForKey("email") as! String)
                self.user = User(id: id, first_name: firstName, last_name: lastName, email: email)
                
                let encodedUser = NSKeyedArchiver.archivedDataWithRootObject(self.user!)
                (self.defaults.setObject(encodedUser, forKey: "user"))
                
                self.getUserAccount()
            } else {
                print("Unable to retrieve user")
            }
        }
    }
    
    func getUserAccount() {
        //API call to get user data/groups
        //if user == nil, create user
        
        groups = [Group(name: "Default Group", image: UIImage(named: "default")!, members: ["John Smith", "Jane Smith", "Jordan Leeper", "Dillon Mulroy", "Andrew Prokop"])]
        
        if let groups = groups {
            let encodedGroup = NSKeyedArchiver.archivedDataWithRootObject(groups)
            defaults.setObject(encodedGroup, forKey: "groups")
            self.performSegueWithIdentifier("landingScene", sender: self)
        } else {
            self.performSegueWithIdentifier("registerGroup", sender: self)
        }
    }

}

