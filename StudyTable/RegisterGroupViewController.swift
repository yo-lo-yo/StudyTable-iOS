//
//  RegisterGroupViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/23/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit

class RegisterGroupViewController: UIViewController {
    
    
    @IBOutlet weak var userNameLabel: UILabel!

    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userName!
        print("in register vc")
    }
    
    
}