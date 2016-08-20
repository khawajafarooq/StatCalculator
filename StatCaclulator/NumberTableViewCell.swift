//
//  NumberTableViewCell.swift
//  StatCaclulator
//
//  Created by GIB on 7/26/16.
//  Copyright © 2016 Xmen. All rights reserved.
//

import UIKit

class NumberTableViewCell: UITableViewCell {

    @IBOutlet weak var editableTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.editableTextField.hidden = true
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(editing: Bool) {
        
        self.editableTextField.text = self.textLabel?.text
        self.editableTextField.hidden = !editing
        self.textLabel?.hidden = editing
    }
    
    @IBAction func negateClicked(sender: AnyObject) {
        
        let number = Double(self.textLabel!.text!)!
        if number > 0 {
            self.editableTextField.text! = "\(number * -1)"
        }
    }
}
