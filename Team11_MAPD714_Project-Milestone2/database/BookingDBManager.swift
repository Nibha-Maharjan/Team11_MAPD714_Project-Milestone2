//
//  BookingDBManager.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-12-01.
//

import Foundation
import SQLite3

class BookingDBManager {
    init() {
        db = openDatabase() // Initialize database
        createTable() // Create table on initialization
    }

    let dataPath: String = "Booking"
    var db: OpaquePointer? // SQLite database pointer

    // Function to open the database
    func openDatabase() -> OpaquePointer? {
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(dataPath)
        var db: OpaquePointer? = nil

        if sqlite3_open(filePath.path, &db) != SQLITE_OK {
            debugPrint("Can't open DB")
            return nil
        } else {
            print("DB Created successfully")
            return db
        }
    }

    // Function to create booking table
    func createTable() {
        // SQL statement for create statement
        let createTableString = """
        CREATE TABLE IF NOT EXISTS Booking (
            id TEXT PRIMARY KEY,
            userId INTEGER,
            cruiseName TEXT,
            cruiseDescription TEXT,
            cruiseVisitingPlaces TEXT,
            cruiseDuration TEXT,
            cruisePriceBooking INTEGER,
            cruiseAdultCount TEXT,
            cruiseChildCount TEXT,
            cruiseBookingDate TEXT,
            cruiseSeniorCitizen INTEGER,
            cruiseTotalPrice TEXT,
            contactNumber TEXT,
            fullname TEXT,
            address TEXT,
            city TEXT,
            country TEXT
        );
        """
        var createTableStatement: OpaquePointer? = nil

        // Executing the create table statement
        // Additional logic to handle execution result
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Booking table created successfully")
            } else {
                print("Booking table creation failed")
            }
        } else {
            print("CREATE TABLE statement failed")
        }
        sqlite3_finalize(createTableStatement)
    }

    // Function to add booking
    func insert(booking: BookingDB) -> String {
        // SQL statement to insert booking
        let insertStatementString = "INSERT INTO Booking (id, userId, cruiseName, cruiseDescription, cruiseVisitingPlaces, cruiseDuration, cruisePriceBooking, cruiseAdultCount, cruiseChildCount, cruiseBookingDate, cruiseSeniorCitizen, cruiseTotalPrice, contactNumber, fullname, address, city, country) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil

        // Executing the insert booking statement
        // Additional logic to handle execution result
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (booking.id as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 2, Int32(booking.userId))
            sqlite3_bind_text(insertStatement, 3, (booking.cruiseName as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (booking.cruiseDescription as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (booking.cruiseVisitingPlaces as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, (booking.cruiseDuration as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 7, Int32(booking.cruisePriceBooking))
            sqlite3_bind_text(insertStatement, 8, (booking.cruiseAdultCount as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 9, (booking.cruiseChildCount as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 10, (booking.cruiseBookingDate as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 11, booking.cruiseSeniorCitizen ? 1 : 0)
            sqlite3_bind_text(insertStatement, 12, (booking.cruiseTotalPrice as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 13, (booking.contactNumber as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 14, (booking.fullname as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 15, (booking.address as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 16, (booking.city as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 17, (booking.country as NSString).utf8String, -1, nil)

            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")

                sqlite3_finalize(insertStatement)
                return booking.id
            } else {
                print("Failed to insert row.")
            }
            if sqlite3_step(insertStatement) != SQLITE_DONE {
                let errmsg = String(cString: sqlite3_errmsg(db))
                print("Failure inserting row: \(errmsg)")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }

        sqlite3_finalize(insertStatement)
        return "-1"  // Indicating failure
    }

    // Function to delete booking by ID
    func deleteByID(id: String) -> Bool {
        let deleteStatementString = "DELETE FROM Booking WHERE id = ?;"
        var deleteStatement: OpaquePointer? = nil

        if sqlite3_prepare_v2(db, deleteStatementString, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(deleteStatement, 1, (id as NSString).utf8String, -1, nil)

            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
                sqlite3_finalize(deleteStatement)
                return true
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared.")
        }

        sqlite3_finalize(deleteStatement)
        return false
    }

    // Function to read bookings by user ID
    func readBookingsByUserId(userId: Int) -> [BookingDB] {
        // SQL statement to get booking for userId
        let queryStatementString = "SELECT * FROM Booking WHERE userId = ?;"
        var queryStatement: OpaquePointer? = nil
        var bookings: [BookingDB] = []

        // Executing SQL statement
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(queryStatement, 1, Int32(userId))

            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                let userId = Int(sqlite3_column_int(queryStatement, 1))
                let cruiseName = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let cruiseDescription = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let cruiseVisitingPlaces = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let cruiseDuration = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
                let cruisePriceBooking = Int(sqlite3_column_int(queryStatement, 6))
                let cruiseAdultCount = String(describing: String(cString: sqlite3_column_text(queryStatement, 7)))
                let cruiseChildCount = String(describing: String(cString: sqlite3_column_text(queryStatement, 8)))
                let cruiseBookingDate = String(describing: String(cString: sqlite3_column_text(queryStatement, 9)))
                let cruiseSeniorCitizen = sqlite3_column_int(queryStatement, 10) != 0
                let cruiseTotalPrice = String(describing: String(cString: sqlite3_column_text(queryStatement, 11)))
                let contactNumber = String(describing: String(cString: sqlite3_column_text(queryStatement, 12)))
                let fullname = String(describing: String(cString: sqlite3_column_text(queryStatement, 13)))
                let address = String(describing: String(cString: sqlite3_column_text(queryStatement, 14)))
                let city = String(describing: String(cString: sqlite3_column_text(queryStatement, 15)))
                let country = String(describing: String(cString: sqlite3_column_text(queryStatement, 16)))

                // Initialize the BookingDB object with extracted values
                let booking = BookingDB(id: id, userId: userId, cruiseName: cruiseName, cruiseDescription: cruiseDescription, cruiseVisitingPlaces: cruiseVisitingPlaces, cruiseDuration: cruiseDuration, cruisePriceBooking: cruisePriceBooking, cruiseAdultCount: cruiseAdultCount, cruiseChildCount: cruiseChildCount, cruiseBookingDate: cruiseBookingDate, cruiseSeniorCitizen: cruiseSeniorCitizen, cruiseTotalPrice: cruiseTotalPrice, contactNumber: contactNumber, fullname: fullname, address: address, city: city, country: country)

                // Append the booking to the bookings array
                bookings.append(booking)
            }
        } else {
            print("SELECT statement failed to proceed")
        }
        sqlite3_finalize(queryStatement)
        return bookings
    }

    // Function to get a specific booking by ID
    func getBookingById(id: String) -> BookingDB? {
        // SQL statement to get booking for id
        let queryStatementString = "SELECT * FROM Booking WHERE id = ?;"
        var queryStatement: OpaquePointer? = nil
        var booking: BookingDB?
        
        

        // Executing SQL statement
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(queryStatement, 1, (id as NSString).utf8String, -1, nil)

            if sqlite3_step(queryStatement) == SQLITE_ROW {
                // Extract each field from the query result
                let id = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                let userId = Int(sqlite3_column_int(queryStatement, 1))
                let cruiseName = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let cruiseDescription = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let cruiseVisitingPlaces = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let cruiseDuration = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
                let cruisePriceBooking = Int(sqlite3_column_int(queryStatement, 6))
                let cruiseAdultCount = String(describing: String(cString: sqlite3_column_text(queryStatement, 7)))
                let cruiseChildCount = String(describing: String(cString: sqlite3_column_text(queryStatement, 8)))
                let cruiseBookingDate = String(describing: String(cString: sqlite3_column_text(queryStatement, 9)))
                let cruiseSeniorCitizen = sqlite3_column_int(queryStatement, 10) != 0
                let cruiseTotalPrice = String(describing: String(cString: sqlite3_column_text(queryStatement, 11)))
                let contactNumber = String(describing: String(cString: sqlite3_column_text(queryStatement, 12)))
                let fullname = String(describing: String(cString: sqlite3_column_text(queryStatement, 13)))
                let address = String(describing: String(cString: sqlite3_column_text(queryStatement, 14)))
                let city = String(describing: String(cString: sqlite3_column_text(queryStatement, 15)))
                let country = String(describing: String(cString: sqlite3_column_text(queryStatement, 16)))

                // Initialize the BookingDB object with extracted values
                booking = BookingDB(id: id, userId: userId, cruiseName: cruiseName, cruiseDescription: cruiseDescription, cruiseVisitingPlaces: cruiseVisitingPlaces, cruiseDuration: cruiseDuration, cruisePriceBooking: cruisePriceBooking, cruiseAdultCount: cruiseAdultCount, cruiseChildCount: cruiseChildCount, cruiseBookingDate: cruiseBookingDate, cruiseSeniorCitizen: cruiseSeniorCitizen, cruiseTotalPrice: cruiseTotalPrice, contactNumber: contactNumber, fullname: fullname, address: address, city: city, country: country)
            } else {
                print("Query returned no results")
            }
        } else {
            let errmsg = String(cString: sqlite3_errmsg(db))
            print("SELECT statement could not be prepared: \(errmsg)")
        }
        sqlite3_finalize(queryStatement)
        return booking
    }
}






