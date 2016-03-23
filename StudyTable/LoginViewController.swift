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
    var id: String = "id"
    var name: String = "name"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fbButton.readPermissions = ["public_profile",  "email", "user_friends"]
        fbButton.delegate = self
        
        if(nil != FBSDKAccessToken.currentAccessToken()) {
            fbButton.hidden = true
            getUserData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if(error == nil) {
            getUserData()
        } else {
            print("Error logging in.")
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        let loginManager: FBSDKLoginManager = FBSDKLoginManager.init()
        loginManager.logOut()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let tabBarVC = segue.destinationViewController as! UITabBarController
        let hoursLoggedVC = tabBarVC.viewControllers![0] as! HourLoggingViewController
        hoursLoggedVC.name = self.name
    }
    
    func getUserData() {
        FBSDKGraphRequest.init(graphPath: "me", parameters: nil).startWithCompletionHandler { (connection, result, error) -> Void in
            if(error == nil) {
                let name: String = (result.objectForKey("name") as? String)!
                let id: String = (result.objectForKey("id") as? String)!
                
                self.name = name
                self.id = id
                
                self.performSegueWithIdentifier("loggedIn", sender: self)
            } else {
                self.name = "Unable to retrieve name"
                self.id = "Unable to retrieve id"
            }
        }
    }

}

