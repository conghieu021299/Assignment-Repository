//
//  RepositoriesTableViewCell.swift
//  RepositoriesGithub
//
//  Created by Hieu on 11/4/20.
//  Copyright © 2020 Hieunc. All rights reserved.
//

import UIKit

class RepositoriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
