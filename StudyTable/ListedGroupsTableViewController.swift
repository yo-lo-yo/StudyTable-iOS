//
//  ListedGroupsViewControllerTableViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/28/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit

class ListedGroupsTableViewController: UITableViewController {

    var groups = [Group(name: "Default Group", image: UIImage(named: "default")!, members: ["John Smith", "Jane Smith", "Jordan Leeper", "Dillon Mulroy", "Andrew Prokop"])]
    
    var selectedGroup: Group?

    let cellIdentifier = "GroupTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! GroupTableViewCell
        cell.groupNameLabel.text = groups[indexPath.row].name
        cell.groupImage.image = groups[indexPath.row].image

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedGroup = groups[indexPath.row]
        performSegueWithIdentifier("viewSelectedGroup", sender: self)
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if("viewSelectedGroup" == segue.identifier) {
            if let group = self.selectedGroup {
                let groupDetailNavVC = segue.destinationViewController as! UINavigationController
                let groupVC = groupDetailNavVC.topViewController as! GroupDetailViewController
                groupVC.inputGroupImage = group.image
                groupVC.groupMemberNames = group.members
                groupVC.inputGroupName = group.name
                print(group.members)
            }
        }
    }
    
    

}
