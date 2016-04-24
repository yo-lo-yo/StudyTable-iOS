//
//  GroupSplitViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/28/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit

class GroupSplitViewController: UISplitViewController, UISplitViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        tabBarItem.image = UIImage(named: "group")
        tabBarItem.selectedImage = UIImage(named: "groupSelected")
    }
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool{
        return true
    }
    
}
