//
//  BookingDB.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-27.
//

import Foundation

class BookingDB {
    
    var bookingID: Int
    var cruiseType: String
    var cruiseDate: String
    var cruiseAdults: Int
    var cruiseKids: Int
    var cruiseSeniors: String
    var cruiseNights: Int
    var cruisePriceBooking: Int
    var cruisePriceBookingTotal: Int
    
    
    
    init(
        bookingID: Int,
         cruiseType: String,
         cruiseDate: String,
         cruiseAdults: Int,
         cruiseKids: Int,
         cruiseSeniors: String,
         cruiseNights: Int,
         cruisePriceBooking: Int,
         cruisePriceBookingTotal: Int) {
        
        
        self.bookingID = bookingID
        self.cruiseType = cruiseType
        self.cruiseDate = cruiseDate
        self.cruiseAdults = cruiseAdults
        self.cruiseKids = cruiseKids
        self.cruiseSeniors = cruiseSeniors
        self.cruiseNights = cruiseNights
        self.cruisePriceBooking = cruisePriceBooking
        self.cruisePriceBookingTotal = cruisePriceBookingTotal
    }
}

