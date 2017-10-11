//
//  NumberTableViewController.swift
//  StatCaclulator
//
//  Created by GIB on 7/26/16.
//  Copyright © 2016 Xmen. All rights reserved.
//

import UIKit

class NumberTableViewController: UITableViewController {

    var data: [Double] = []
    
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
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CKNumberCell", for: indexPath as IndexPath) as! NumberTableViewCell
        
        if let number = data[indexPath.row] as Double? {
            cell.textLabel?.text = "\(number)"
        }
        
        return cell
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            deleteItemAtIndex(indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
        }
    }
    
    // MARK: Helper Methods
    func createBarButtons() {
        
        let clearButton:UIBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clearList))
        let editButton:UIBarButtonItem = self.editButtonItem
        let fixedSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = -40.0
        
        self.navigationItem.rightBarButtonItems = [clearButton, fixedSpace, editButton]
    }
    
    func deleteItemAtIndex(_ index: Int) {
        if index < data.count {
            
            // 1. Delete item from data array
            // 2. Notify calculator to update
            data.remove(at :index)
            
            let userInfo: NSDictionary = [Constants.GNRC.ItemIndex: NSNumber(value: index)]
            NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.NotificationKey.DeleteItem), object: userInfo)
        }
    }
    
    func editTableView(_ editing: Bool) {
        
        for index in 0..<data.count {
            let cell: NumberTableViewCell = self.tableView.cellForRow(at: IndexPath(row: index, section: 0)) as! NumberTableViewCell
            cell.configureCell(editing)
        }
    }
    
    func updateTableViewData() {
        
        for index in 0..<data.count {
            
            let cell: NumberTableViewCell = self.tableView.cellForRow(at: IndexPath(row: index, section: 0)) as! NumberTableViewCell
            print("Updating cell data:"+cell.editableTextField.text!)
            data[index] = Double(cell.editableTextField.text!)!
        }
        
        reloadTable()
        let userInfo: NSDictionary = [Constants.GNRC.DataItem: data]
        NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.NotificationKey.RefreshData), object: userInfo)
    }
    
    func reloadTable() {
        self.tableView.reloadData()
    }
    
    func clearList() {
        if !data.isEmpty {
            data.removeAll()
            reloadTable()
        }
        NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.NotificationKey.ClearData), object: nil)
    }
}
