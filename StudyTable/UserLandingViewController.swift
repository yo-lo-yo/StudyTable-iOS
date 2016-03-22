//
//  UserLandingViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/17/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import Foundation
import UIKit

class UserLandingViewController: UIViewController {
    
    @IBOutlet weak var user: UILabel!
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user.text = name
        print("UserLandingViewController viewDidLoad for: " + name)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}