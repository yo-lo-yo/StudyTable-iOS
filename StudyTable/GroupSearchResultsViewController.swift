//
//  GroupSearchResultsViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/25/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit

class GroupSearchResultsViewController: UITableViewController, UINavigationControllerDelegate {
    
    var groups = [String]()
    
    let cellIdentifier = "GroupTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Results"
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! GroupTableViewCell
        let group = groups[indexPath.row]
        
        cell.groupNameLabel.text = group
        
        return cell
    }
}
