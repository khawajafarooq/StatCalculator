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
        self.editableTextField.isHidden = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(_ editing: Bool) {
        
        self.editableTextField.text = self.textLabel?.text
        self.editableTextField.isHidden = !editing
        self.textLabel?.isHidden = editing
    }
    
    @IBAction func negateClicked(sender: AnyObject) {
        
        let number = Double(self.textLabel!.text!)!
        if number > 0 {
            self.editableTextField.text! = "\(number * -1)"
        }
    }
}
