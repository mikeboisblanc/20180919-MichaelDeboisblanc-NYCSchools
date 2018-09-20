//
//  SchoolListingCell.swift
//  20180919-MichaelDeboisblanc-NYCSchools
//
//  Created by Michael deBoisblanc on 9/19/18.
//  Copyright © 2018 Michael deBoisblanc. All rights reserved.
//

import UIKit

class SchoolListingCell: UITableViewCell {

    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var neighborhoodLabel: UILabel!
    
    func set(school: School){
        schoolNameLabel.text = school.school_name
        neighborhoodLabel.text = school.neighborhood
    }
    
}
