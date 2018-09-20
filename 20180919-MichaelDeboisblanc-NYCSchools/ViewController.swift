//
//  ViewController.swift
//  20180919-MichaelDeboisblanc-NYCSchools
//
//  Created by Michael deBoisblanc on 9/19/18.
//  Copyright © 2018 Michael deBoisblanc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var schools = [School]()
    var dbn = String()
    var schoolName = String()
    var grades = String()
    var phoneNumber = String()
    var address = String()
    var totalStudents = String()
    var website = String()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let schoolCellNib = UINib(nibName: "SchoolListingCell", bundle: nil)
        tableView.register(schoolCellNib, forCellReuseIdentifier: "schoolCellId")
        NetworkServices.extractSchoolJSON(){
            DispatchQueue.main.async {
                self.schools = NetworkServices.schools
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?  SATScoresViewController {
            destination.dbn = self.dbn
            destination.schoolName = self.schoolName
            destination.grades = self.grades
            destination.phoneNumber = self.phoneNumber
            destination.address = self.address
            destination.totalStudents = self.totalStudents
            destination.website = self.website
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "schoolCellId", for: indexPath) as! SchoolListingCell
        cell.set(school: schools[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //normally I would pass data to the next viewController by defining a var school = School() in this view controller--outside of any function. If I had more time I would look into why I am getting an error when I try to do that. My work around was to define each variable from the school struct that I'm passing along, then do the appropriate work in the prepare for segue function above.
        let school = schools[indexPath.row]
        dbn = school.dbn
        schoolName = school.school_name
        grades = school.finalgrades
        phoneNumber = school.phone_number
        address = school.primary_address_line_1
        totalStudents = school.total_students
        website = school.website
        self.performSegue(withIdentifier: "toSATScores", sender: nil)
    }
}

