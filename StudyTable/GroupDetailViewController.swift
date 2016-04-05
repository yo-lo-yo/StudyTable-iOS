//
//  GroupViewController.swift
//  StudyTable
//
//  Created by Jordan Leeper on 3/23/16.
//  Copyright © 2016 Jordan Leeper. All rights reserved.
//

import UIKit

class GroupDetailViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var groupMemberTable: UITableView!
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    var group: Group?
    let cellIdentifier = "GroupMembersTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupMemberTable.delegate = self
        groupMemberTable.dataSource = self
        
        if let group = group {
            groupImage.image = group.image
            groupNameLabel.text = group.name
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let groups = group?.members {
            return groups.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! GroupMembersTableViewCell
        
        cell.groupMembersNames.text = group?.members[indexPath.row]
        return cell
    }
}
