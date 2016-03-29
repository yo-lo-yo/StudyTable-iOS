//
//  UserLandingViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/17/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import Foundation
import UIKit

class HourLoggingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet weak var user: UILabel!
    var userName: String = ""
    var pickerData:[String] = []
    var selectedHours = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        user.text = ("Hi, ") + userName
        navigationItem.title = "Log"
        for x in 0..<24 {
            pickerData.insert("\(x+1)", atIndex: x)
        }
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
        print(selectedHours)
    }
    
    
}