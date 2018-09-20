//
//  File.swift
//  20180919-MichaelDeboisblanc-NYCSchools
//
//  Created by Michael deBoisblanc on 9/19/18.
//  Copyright © 2018 Michael deBoisblanc. All rights reserved.
//

import Foundation

struct SATScores: Codable{
    var dbn: String
    var sat_critical_reading_avg_score: String
    var sat_math_avg_score: String
    var sat_writing_avg_score: String
    var school_name: String
}
