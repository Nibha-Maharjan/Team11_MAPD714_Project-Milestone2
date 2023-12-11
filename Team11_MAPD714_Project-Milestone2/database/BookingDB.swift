//
//  BookingDB.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-27.
//

import Foundation

class BookingDB {
    var id: String
    var userId: Int
    var cruiseName: String
    var cruiseDescription: String
    var cruiseVisitingPlaces: String
    var cruiseDuration: String 
    var cruisePriceBooking: Int
    var cruiseAdultCount: String
    var cruiseChildCount: String
    var cruiseBookingDate: String
    var cruiseSeniorCitizen: Bool
    var cruiseTotalPrice: String
    var contactNumber: String
    var fullname: String
    var address: String
    var city: String
    var country: String

    init(id: String, userId: Int, cruiseName: String, cruiseDescription: String, cruiseVisitingPlaces: String, cruiseDuration: String, cruisePriceBooking: Int, cruiseAdultCount: String, cruiseChildCount: String, cruiseBookingDate: String, cruiseSeniorCitizen: Bool, cruiseTotalPrice: String, contactNumber: String, fullname: String, address: String, city: String, country: String) {
        self.id = id
        self.userId = userId
        self.cruiseName = cruiseName
        self.cruiseDescription = cruiseDescription
        self.cruiseVisitingPlaces = cruiseVisitingPlaces
        self.cruiseDuration = cruiseDuration
        self.cruisePriceBooking = cruisePriceBooking
        self.cruiseAdultCount = cruiseAdultCount
        self.cruiseChildCount = cruiseChildCount
        self.cruiseBookingDate = cruiseBookingDate
        self.cruiseSeniorCitizen = cruiseSeniorCitizen
        self.cruiseTotalPrice = cruiseTotalPrice
        self.contactNumber = contactNumber
        self.fullname = fullname
        self.address = address
        self.city = city
        self.country = country
    }
}

