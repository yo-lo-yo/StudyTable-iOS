//
//  RegisterUserViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 4/23/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit
import Firebase

class RegisterUserViewController: UIViewController {
    
    private var ref = Firebase(url: Constants.firebaseRootURL)
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func register(sender: UIButton) {
        self.ref?.createUser(emailField.text, password: passwordField.text) { (error: NSError!) in
                if error == nil {
                    //authenticate user if creation was successful
                    self.ref?.authUser(self.emailField.text, password: self.passwordField.text,
                        withCompletionBlock: { (error, auth) -> Void in
                            //TODO: - Handle error != nil here
                            let user = User(id:auth.uid, firstName: self.firstNameField.text!, lastName: self.lastNameField.text!, email: self.emailField.text!)
                            
                            self.ref.childByAppendingPath("/users/\(auth.uid)").setValue(user.asDictionary())
                            
                            self.performSegueWithIdentifier("registerGroup", sender: self)
                    })
                } else {
                    self.errorLabel.text = error.description
                    print(error.description)
                }
        }

    }
}
