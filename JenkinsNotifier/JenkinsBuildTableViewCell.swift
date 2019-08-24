//
//  JenkinsBuildTableViewCell.swift
//  JenkinsNotifier
//
//  Created by Ryan Lokugamage on 8/24/19.
//  Copyright © 2019 Ryan Lokugamage. All rights reserved.
//

import UIKit

class JenkinsBuildTableViewCell: UITableViewCell {
    @IBOutlet weak var buildName: UITextField!
    @IBOutlet weak var buildStatus: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
