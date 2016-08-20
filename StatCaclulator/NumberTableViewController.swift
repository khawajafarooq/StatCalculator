//
//  NumberTableViewController.swift
//  StatCaclulator
//
//  Created by GIB on 7/26/16.
//  Copyright © 2016 Xmen. All rights reserved.
//

import UIKit

class NumberTableViewController: UITableViewController {

    
    var data = Array<Double>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create navigation item bar buttons
        createBarButtons()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CKNumberCell", forIndexPath: indexPath) as! NumberTableViewCell
        
        if let number = data[indexPath.row] as Double? {
            cell.textLabel?.text = "\(number)"
        }
        
        return cell
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        
        super.setEditing(editing, animated: animated)
        
        if editing {
            // set editable mode
            editTableView(editing)
        }
        else {
            // save data
            updateTableViewData()
            editTableView(editing)
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            deleteItemAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    // MARK: Helper Methods
    func createBarButtons() {
        
        let clearButton:UIBarButtonItem = UIBarButtonItem(title: "Clear", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(clearList))
        let editButton:UIBarButtonItem = self.editButtonItem()
        let fixedSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        fixedSpace.width = -40.0
        
        self.navigationItem.rightBarButtonItems = [clearButton, fixedSpace, editButton]
    }
    
    func deleteItemAtIndex(index: Int) {
        if index < data.count {
            
            // 1. Delete item from data array
            // 2. Notify calculator to update
            data.removeAtIndex(index)
            
            let userInfo: NSDictionary = [Constants.GNRC.ItemIndex: NSNumber.init(integer: index)]
            NSNotificationCenter.defaultCenter().postNotificationName(Constants.NotificationKey.DeleteItem, object: userInfo)
        }
    }
    
    func editTableView(editing: Bool) {
        
        for index in 0..<data.count {
            let cell: NumberTableViewCell = self.tableView.cellForRowAtIndexPath(NSIndexPath.init(forRow: index, inSection: 0)) as! NumberTableViewCell
            cell.configureCell(editing)
        }
    }
    
    func updateTableViewData() {
        
        for index in 0..<data.count {
            let cell: NumberTableViewCell = self.tableView.cellForRowAtIndexPath(NSIndexPath.init(forRow: index, inSection: 0)) as! NumberTableViewCell
            print("Updating cell data:"+cell.editableTextField.text!)
            data[index] = Double(cell.editableTextField.text!)!
        }
        
        reloadTable()
        let userInfo: NSDictionary = [Constants.GNRC.DataItem: data]
        NSNotificationCenter.defaultCenter().postNotificationName(Constants.NotificationKey.RefreshData, object: userInfo)
    }
    
    func reloadTable() {
        self.tableView.reloadData()
    }
    
    func clearList() {
        if !data.isEmpty {
            data.removeAll()
            reloadTable()
        }
        NSNotificationCenter.defaultCenter().postNotificationName(Constants.NotificationKey.ClearData, object: nil)
    }
}
