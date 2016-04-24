//
//  UserLandingViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/17/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit
import Firebase

class LogHoursViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet weak var nameLabel: UILabel!
    private let ref = Firebase(url: Constants.firebaseRootURL)
    var pickerData:[String] = []
    var selectedHours = "1"
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Log Hours"
        self.tabBarController?.navigationItem.hidesBackButton = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in 0..<24 {
            pickerData.insert("\(x+1)", atIndex: x)
        }
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedHours = pickerData[row]
    }
    
    @IBAction func logHours(sender: AnyObject) {
        let alert = UIAlertController(title: nil, message: "Log \(selectedHours) Hours?", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Log", style: .Default, handler: sendLoggedHours))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func sendLoggedHours(action: UIAlertAction) {
        let auth = ref.authData
        let hoursRef = ref.childByAppendingPath("users/\(auth.uid)/hours")
        if let log = Int(selectedHours) {
            let hours = ["amount" : log, "date" : FirebaseServerValue.timestamp()]
            hoursRef.childByAutoId().setValue(hours)
        }
    }
    
    
}