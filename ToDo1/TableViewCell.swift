//
//  TableViewCell.swift
//  ToDo1
//
//  Created by Vishnu Deep Samikeri on 4/6/18.
//  Copyright © 2018 vDeep. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var selectedCellIndexpath:IndexPath? = nil
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var stacks: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func toggleCell(index:IndexPath)
    {
        if index == self.selectedCellIndexpath {
            // height.constant = 90.0
            stacks.isHidden = false
        }else{
            // height.constant = 0.0
            stacks.isHidden = true
        }
    }
}
