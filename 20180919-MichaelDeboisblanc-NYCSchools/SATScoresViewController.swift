//
//  SATScoresViewController.swift
//  20180919-MichaelDeboisblanc-NYCSchools
//
//  Created by Michael deBoisblanc on 9/19/18.
//  Copyright © 2018 Michael deBoisblanc. All rights reserved.
//

import UIKit

class SATScoresViewController: UIViewController {
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var satReadingLabel: UILabel!
    @IBOutlet weak var satMathLabel: UILabel!
    @IBOutlet weak var satWritingLabel: UILabel!
    
    @IBOutlet weak var gradesAndStudentBodyLabel: UILabel!
    

    var satScoresData = [SATScores]()
    var dbn = String()
    var schoolName = String()
    var grades = String()
    var phoneNumber = String()
    var address = String()
    var totalStudents = String()
    var website = String()
    var match = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkServices.extractSATScoresJSON(){
            DispatchQueue.main.async {
                self.satScoresData = NetworkServices.satScores
                for satListing in self.satScoresData{
                    if self.dbn == satListing.dbn{
                        self.satReadingLabel.text = "SAT Reading: \(satListing.sat_critical_reading_avg_score)"
                        self.satMathLabel.text = "SAT Math: \(satListing.sat_math_avg_score)"
                        self.satWritingLabel.text = "SAT Writing: \(satListing.sat_writing_avg_score)"
                        self.match = true
                    }
                }
                if self.match == false{
                    self.satReadingLabel.text = "SAT Reading: Score not available."
                    self.satMathLabel.text = "SAT Math:  Score not available."
                    self.satWritingLabel.text = "SAT Writing:  Score not available."
                }
                self.populateRemainingLabels()
            }
        }
    }

    func populateRemainingLabels(){
        self.schoolNameLabel.text = schoolName
        addressLabel.text = address
        phoneNumberLabel.text = phoneNumber
        websiteLabel.text = website
        gradesAndStudentBodyLabel.text = "This school teaches grades \(grades). Its student body consists of \(totalStudents) students."
    }
    
}
