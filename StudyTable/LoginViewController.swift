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
        performSegueWithIdentifier("registerUser", sender: self)
    }
    
    
    func getUserData(data: FAuthData) {
        let uidArray = data.uid.componentsSeparatedByString(":")
        let uid = uidArray[1]
        
        let userRef = ref.childByAppendingPath("users/\(uid)")

        userRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
            if snapshot.value is NSNull {
                print("No user exists")
                //create user
            } else {
                let groupRef = userRef.childByAppendingPath("/groups")
                groupRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
                    if snapshot.value is NSNull {
                        print("no groups found")
                        self.performSegueWithIdentifier("registerGroup", sender: self)
                    } else {
                        print("outside for loop")
                        
                        for group in snapshot.children.allObjects {
                            let groupDataRef = self.ref.childByAppendingPath("/groups/\(group.key)")
//                            groupDataRef.observeSingleEventOfType(.Value, withBlock: {snapshot in
////                                if snapshot.value is NSNull {
////                                    print("didn't get group info")
////                                } else {
////                                    self.groups.append(Group(name: snapshot.value.objectForKey("groupName")! as! String, image: UIImage(named: "default")!, members: ["John Smith", "Jane Smith"]))
////                                    print(snapshot.value.objectForKey("groupName"))
////                                }
//                            })
                        }
                        
                        self.performSegueWithIdentifier("landingScene", sender: self)
                    }
                })
            }
        })
        
        //groups = [Group(name: "Default Group", image: UIImage(named: "default")!, members: ["John Smith", "Jane Smith", "Jordan Leeper", "Dillon Mulroy", "Andrew Prokop"])]
        
    }

}

