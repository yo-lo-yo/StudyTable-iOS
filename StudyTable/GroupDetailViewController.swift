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
    var inputGroupImage: UIImage?
    var inputGroupName: String?
    var groupMemberNames: [String]? = nil
    let cellIdentifier = "GroupMembersTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupMemberTable.delegate = self
        groupMemberTable.dataSource = self
        groupImage.image = inputGroupImage
        groupNameLabel.text = inputGroupName
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMemberNames!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! GroupMembersTableViewCell
        let groupMemberName = groupMemberNames![indexPath.row]
        print(groupMemberName)
        cell.groupMembersNames.text = groupMemberName
        
        return cell
    }
}
