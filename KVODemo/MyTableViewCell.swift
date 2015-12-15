//
//  MyTableViewCell.swift
//  KVODemo
//
//  Created by cxria on 15/12/4.
//  Copyright © 2015年 cxria. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var myimage: UIImageView!
    
    @IBOutlet weak var countLbale: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
