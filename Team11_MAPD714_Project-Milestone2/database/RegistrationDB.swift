//
//  RegistrationDB.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-25.
//

import Foundation

class RegistrationDB {
    var customerID: Int
    var customerFullName: String
    var customerEmail: String
    var customerPassword: String
    var customerAge: Int
    var customerAddress: String
    
    init(customerID: Int, 
         customerFullName: String,
         customerEmail: String,
         customerPassword: String,
         customerAge: Int,
         customerAddress: String) {
        
        
        self.customerID = customerID
        self.customerFullName = customerFullName
        self.customerEmail = customerEmail
        self.customerPassword = customerPassword
        self.customerAge = customerAge
        self.customerAddress = customerAddress
    }
}

