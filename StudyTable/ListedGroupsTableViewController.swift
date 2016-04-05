//
//  ListedGroupsViewControllerTableViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/28/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit

class ListedGroupsTableViewController: UITableViewController {

    var groups: [Group]?
    var selectedGroup: Group?
    let cellIdentifier = "GroupTableViewCell"
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let storedGroups = defaults.objectForKey("groups") as? NSData {
            groups = NSKeyedUnarchiver.unarchiveObjectWithData(storedGroups) as? [Group]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! GroupTableViewCell
        cell.groupNameLabel.text = groups![indexPath.row].name
        cell.groupImage.image = groups![indexPath.row].image

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedGroup = groups![indexPath.row]
        performSegueWithIdentifier("viewSelectedGroup", sender: self)
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if("viewSelectedGroup" == segue.identifier) {
            if let group = selectedGroup {
                let groupVC = segue.destinationViewController as! GroupDetailViewController
                groupVC.group = group
            }
        }
    }
    
    

}
