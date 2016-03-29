//
//  LoggedHoursViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/28/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit

class LoggedHoursViewController: UIViewController {

    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logButtonPressed(sender: AnyObject) {
        performSegueWithIdentifier("logHours", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if("logHours" == segue.identifier) {
            let hourLoggingVC = segue.destinationViewController as! HourLoggingViewController
            if let user = self.name {
                hourLoggingVC.userName = user
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
