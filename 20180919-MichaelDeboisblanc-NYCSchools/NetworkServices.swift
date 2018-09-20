//
//  NetworkServices.swift
//  20180919-MichaelDeboisblanc-NYCSchools
//
//  Created by Michael deBoisblanc on 9/19/18.
//  Copyright © 2018 Michael deBoisblanc. All rights reserved.
//

import Foundation

typealias DownloadComplete = ()->Void

class NetworkServices{
    static var schools = [School]()
    static var satScores = [SATScores]()
    
    static func extractSchoolJSON(completion: @escaping DownloadComplete){
        let endPoint = "https://data.cityofnewyork.us/resource/97mf-9njv.json"
        guard let url = URL(string: endPoint) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {
                completion()
                return
            }
            do{
                self.schools = try JSONDecoder().decode([School].self, from: data)
                completion()
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
                completion()
            }
        }.resume()
    }
    
    static func extractSATScoresJSON(completion: @escaping DownloadComplete){
        let endPoint = "https://data.cityofnewyork.us/resource/734v-jeq5.json"
        guard let url = URL(string: endPoint) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {
                completion()
                return
            }
            do{
                self.satScores = try JSONDecoder().decode([SATScores].self, from: data)
                completion()
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
                completion()
            }
        }.resume()
    }
}
