//
//  ViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/15/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    private let ref = Firebase(url: Constants.firebaseRootURL)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //User is logged in
        if (ref.authData != nil) {
            performSegueWithIdentifier("landingScene", sender: self)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.description == "landingScene" {
            let landingStoryBoard = UIStoryboard.init(name: "Landing", bundle: nil)
            let tabBarVC = landingStoryBoard.instantiateInitialViewController() as! UITabBarController
            let window: UIWindow = UIApplication.sharedApplication().keyWindow!
            window.rootViewController = tabBarVC
            window.makeKeyAndVisible()
        }
    }
    
    @IBAction func login(sender: UIButton) {
        ref.authUser(emailTextField.text, password: passwordTextField.text) { (error, auth) in
            if error == nil {
                self.performSegueWithIdentifier("landingScene", sender: self)
            } else {
                //TODO set error description
                self.errorLabel.text = error.description
            }
        }
    }
    
    @IBAction func register(sender: UIButton) {
        ref.childByAppendingPath("groups/").queryOrderedByChild("groupName").observeSingleEventOfType(.Value, withBlock: { snapshot in
            var groupNames = [String()]
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                for snap in snapshots {
                    if let group = snap.value as? Dictionary<String, String> {
                        print("*** \(group)")
                    }
                }
            }
        })
        performSegueWithIdentifier("registerUser", sender: self)
        
    }
}

