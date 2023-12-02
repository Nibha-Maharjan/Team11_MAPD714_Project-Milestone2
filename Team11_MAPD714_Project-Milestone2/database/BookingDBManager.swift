//
//  BookingDBManager.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-12-01.
//

import Foundation
import SQLite3

class BookingDBManager {
    // MARK: - Initialization
    
    // Initializer for the BookingDBManager class.
    // It opens the SQLite database and creates the necessary table.
    init() {
        db = openDatabase()
        createTable()
    }
    
    // MARK: - Database Handling
    
    // Database path used for SQLite storage.
    let dataPath: String = "BookingsDB"
    
    // OpaquePointer to represent the SQLite database.
    var db: OpaquePointer?
    
    // Function to open the SQLite database.
    func openDatabase() -> OpaquePointer? {
        // Creating a file path for the SQLite database in the document directory.
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dataPath)
        
        // OpaquePointer to represent the SQLite database.
        var db: OpaquePointer? = nil
        
        // Opening the SQLite database.
        if sqlite3_open(filePath.path, &db) != SQLITE_OK {
            debugPrint("Error: Unable to open the database.")
            return nil
        } else {
            print("Database opened successfully.")
            return db
        }
    }
    
    // Function to create the necessary table (Bookings) if it doesn't exist.
    func createTable() {
        // SQLite query to create the Bookings table with appropriate columns.
        let createTableString = """
            CREATE TABLE IF NOT EXISTS Bookings (
                bookingID INTEGER PRIMARY KEY AUTOINCREMENT,
                cruiseType TEXT,
                cruiseDate TEXT,
                cruiseAdults INTEGER,
                cruiseKids INTEGER,
                cruiseSeniors TEXT,
                cruiseNights INTEGER,
                cruisePriceBooking INTEGER,
                cruisePriceBookingTotal INTEGER
            );
        """
        
        // OpaquePointer to represent the SQLite statement.
        var createTableStatement: OpaquePointer? = nil
        
        // Preparing and executing the SQLite query.
        if sqlite3_prepare(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            // Executing the query and checking for success.
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Table 'Bookings' created successfully.")
            } else {
                print("Error: Failed to create table 'Bookings'.")
            }
        } else {
            print("Error: Unable to prepare the create table statement.")
        }
        
        // Finalizing the SQLite statement.
        sqlite3_finalize(createTableStatement)
    }
    
    // Function to insert a new booking into the Bookings table.
    func insert(booking: BookingDB) {
        // SQLite query to insert a new row into the Bookings table.
        let insertStatementString = """
            INSERT INTO Bookings (
                cruiseType,
                cruiseDate,
                cruiseAdults,
                cruiseKids,
                cruiseSeniors,
                cruiseNights,
                cruisePriceBooking,
                cruisePriceBookingTotal
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?);
        """
        
        // OpaquePointer to represent the SQLite statement.
        var insertStatement: OpaquePointer? = nil
        
        // Preparing and executing the SQLite query.
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            // Binding parameters to the SQLite statement.
            sqlite3_bind_text(insertStatement, 1, (booking.cruiseType as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (booking.cruiseDate as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 3, Int32(booking.cruiseAdults))
            sqlite3_bind_int(insertStatement, 4, Int32(booking.cruiseKids))
            sqlite3_bind_text(insertStatement, 5, (booking.cruiseSeniors as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 6, Int32(booking.cruiseNights))
            sqlite3_bind_int(insertStatement, 7, Int32(booking.cruisePriceBooking))
            sqlite3_bind_int(insertStatement, 8, Int32(booking.cruisePriceBookingTotal))
            
            // Executing the query and checking for success.
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Booking added successfully.")
            } else {
                print("Error: Failed to add a new booking.")
            }
        } else {
            print("Error: Unable to prepare the insert statement.")
        }
        
        // Finalizing the SQLite statement.
        sqlite3_finalize(insertStatement)
    }
    
    // Function to retrieve all booking records from the Bookings table.
    func readBookings() -> [BookingDB] {
        let queryStatementString = "SELECT * FROM Bookings;"
        
        // OpaquePointer to represent the SQLite statement.
        var queryStatement: OpaquePointer? = nil
        
        // Array to store booking records.
        var bookingsArray: [BookingDB] = []
        
        // Preparing and executing the SQLite query.
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            // Looping through each row of the result set.
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                // Extracting data from the result set columns.
                let bookingID = Int(sqlite3_column_int(queryStatement, 0))
                let cruiseType = String(cString: sqlite3_column_text(queryStatement, 1))
                let cruiseDate = String(cString: sqlite3_column_text(queryStatement, 2))
                let cruiseAdults = Int(sqlite3_column_int(queryStatement, 3))
                let cruiseKids = Int(sqlite3_column_int(queryStatement, 4))
                let cruiseSeniors = String(cString: sqlite3_column_text(queryStatement, 5))
                let cruiseNights = Int(sqlite3_column_int(queryStatement, 6))
                let cruisePriceBooking = Int(sqlite3_column_int(queryStatement, 7))
                let cruisePriceBookingTotal = Int(sqlite3_column_int(queryStatement, 8))
                
                // Creating a BookingDB object and adding it to the array.
                let booking = BookingDB(
                    bookingID: bookingID,
                    cruiseType: cruiseType,
                    cruiseDate: cruiseDate,
                    cruiseAdults: cruiseAdults,
                    cruiseKids: cruiseKids,
                    cruiseSeniors: cruiseSeniors,
                    cruiseNights: cruiseNights,
                    cruisePriceBooking: cruisePriceBooking,
                    cruisePriceBookingTotal: cruisePriceBookingTotal
                )
                bookingsArray.append(booking)
                
                // Printing booking details (for demonstration purposes).
                print("Booking Details:")
                print("ID: \(bookingID), Type: \(cruiseType), Date: \(cruiseDate), Adults: \(cruiseAdults), Kids: \(cruiseKids), Seniors: \(cruiseSeniors), Nights: \(cruiseNights), Price: \(cruisePriceBooking), Total Price: \(cruisePriceBookingTotal)")
            }
        } else {
            print("Error: Unable to prepare the select statement.")
        }
        
        // Finalizing the SQLite statement.
        sqlite3_finalize(queryStatement)
        
        // Returning the array of booking records.
        return bookingsArray
    }
    
    // Function to delete a booking from the Bookings table.
    func deleteBooking(bookingID: Int) {
        // SQLite query to delete a row from the Bookings table.
        let deleteStatementString = "DELETE FROM Bookings WHERE bookingID = ?;"
        
        // OpaquePointer to represent the SQLite statement.
        var deleteStatement: OpaquePointer? = nil
        
        // Preparing and executing the SQLite query.
        if sqlite3_prepare_v2(db, deleteStatementString, -1, &deleteStatement, nil) == SQLITE_OK {
            // Binding parameters to the SQLite statement.
            sqlite3_bind_int(deleteStatement, 1, Int32(bookingID))
            
            // Executing the query and checking for success.
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Booking deleted successfully.")
            } else {
                print("Error: Failed to delete the booking.")
            }
        } else {
            print("Error: Unable to prepare the delete statement.")
        }
        
        // Finalizing the SQLite statement.
        sqlite3_finalize(deleteStatement)
    }
}
