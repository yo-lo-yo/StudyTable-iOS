//
//  LoggedHoursViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/28/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit
import Firebase

class LogSummaryViewController: UIViewController {
    
    private let ref = Firebase(url: Constants.firebaseRootURL)
    
    @IBOutlet weak var hoursLoggedLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        
        print("view will appear")
        let auth = ref.authData
        let hoursRef = ref.childByAppendingPath("users/\(auth.uid)/hours")
        
        var hoursLogged = 0
        
        hoursRef.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            print(snapshot)
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                for snap in snapshots {
                    if let data = snap.value as? [String:AnyObject] {
                        hoursLogged += (data["amount"]! as? Int)!
                    }
                }
            }
            self.hoursLoggedLabel.text = String(hoursLogged)
        })
        
        tabBarItem.image = UIImage(named: "hours")
        tabBarItem.selectedImage = UIImage(named: "hoursSelected")
        self.navigationItem.title = "Log Summary"
        self.tabBarController!.navigationItem.hidesBackButton = true;
    }
    
    override func viewDidLoad() {
        print("view did load")
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logHours(sender: AnyObject) {
        performSegueWithIdentifier("logHours", sender: self)
    }


}
