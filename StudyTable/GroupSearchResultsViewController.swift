//
//  GroupSearchResultsViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/25/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit

class GroupSearchResultsViewController: UITableViewController, UINavigationControllerDelegate {

    var groups: [Group]?
    var selectedGroup: Group?
    let cellIdentifier = "GroupTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Results"
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (groups?.count)!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! GroupTableViewCell
        let group = groups![indexPath.row]
        cell.groupImage.image = group.image
        cell.groupNameLabel.text = group.name
    
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let groups = groups {
            selectedGroup = groups[indexPath.row]
            performSegueWithIdentifier("showGroupDetail", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let group = selectedGroup {
            let groupDetailVC = segue.destinationViewController as! GroupDetailViewController
            groupDetailVC.group = group
        }
    }
}
