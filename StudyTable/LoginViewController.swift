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
    var group: String?
    var groupImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fbButton.readPermissions = ["public_profile",  "email", "user_friends"]
        fbButton.delegate = self
        
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
        if(segue.identifier == "viewHourLogger") {
            let tabBarVC = segue.destinationViewController as! UITabBarController
            let hoursLoggedVC = tabBarVC.viewControllers![0] as! HourLoggingViewController
            hoursLoggedVC.userName = self.name
        } else if(segue.identifier == "registerGroup") {
            print("in group segue")
            let registerGroupVC = segue.destinationViewController as! RegisterGroupViewController
            registerGroupVC.userName = self.name
        } else {
            print("can't id segue" + segue.identifier!)
        }
    }
    
    func getFacebookUserData() {
        FBSDKGraphRequest.init(graphPath: "me", parameters: nil).startWithCompletionHandler { (connection, result, error) -> Void in
            if(error == nil) {
                self.name = (result.objectForKey("name") as? String)!
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
        if(nil == group) {
            self.performSegueWithIdentifier("registerGroup", sender: self)
            print("group segue")
        } else {
            self.performSegueWithIdentifier("viewHourLogger", sender: self)
            print("hour segue")
        }
    }

}

