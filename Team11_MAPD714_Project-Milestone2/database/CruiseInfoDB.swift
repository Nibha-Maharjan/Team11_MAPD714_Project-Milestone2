//
//  CruiseInfoDB.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-29.
//

import Foundation

class CruiseDB {
    var cruiseID: Int
    var cruiseName: String
    var cruisePrice: Int
    
    init(cruiseID: Int, cruiseName: String, cruisePrice: Int) {
        self.cruiseID = cruiseID
        self.cruiseName = cruiseName
        self.cruisePrice = cruisePrice
    }
}
