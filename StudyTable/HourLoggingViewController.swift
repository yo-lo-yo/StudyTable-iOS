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
    var selectedHours = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        user.text = ("Hi, ") + userName
        
        for x in 0..<24 {
            pickerData.insert("\(x+1) Hours", atIndex: x)
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
        print(selectedHours)
    }
    
    
}