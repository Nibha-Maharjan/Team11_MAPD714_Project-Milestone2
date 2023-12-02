//
//  CruiseInfoDBManager.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-29.
//

import Foundation
import SQLite3

class CruiseInfoDBManager {
    // MARK: - Initialization
    
    // Initializer for the CruiseInfoDBManager class.
    // It opens the SQLite database and creates the necessary table.
    init() {
        db = openDatabase()
        createTable()
    }
    
    // MARK: - Database Handling
    
    // Database path used for SQLite storage.
    let dataPath: String = "CruisesDB"
    
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
    
    // Function to create the necessary table (Cruises) if it doesn't exist.
    func createTable() {
        // SQLite query to create the Cruises table with appropriate columns.
        let createTableString = """
            CREATE TABLE IF NOT EXISTS Cruises (
                cruiseID INTEGER PRIMARY KEY,
                cruiseName TEXT
            );
        """
        
        // OpaquePointer to represent the SQLite statement.
        var createTableStatement: OpaquePointer? = nil
        
        // Preparing and executing the SQLite query.
        if sqlite3_prepare(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            // Executing the query and checking for success.
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Table 'Cruises' created successfully.")
            } else {
                print("Error: Failed to create table 'Cruises'.")
            }
        } else {
            print("Error: Unable to prepare the create table statement.")
        }
        
        // Finalizing the SQLite statement.
        sqlite3_finalize(createTableStatement)
    }
    
    // Function to insert a new cruise into the Cruises table.
    func insert(cruiseID: Int, cruiseName: String, cruisePrice: Int) {
        // SQLite query to insert a new row into the Cruises table.
        let insertStatementString = """
            INSERT INTO Cruises (cruiseID, cruiseName) VALUES (?, ?);
        """
        
        // OpaquePointer to represent the SQLite statement.
        var insertStatement: OpaquePointer? = nil
        
        // Preparing and executing the SQLite query.
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            // Binding parameters to the SQLite statement.
            sqlite3_bind_int(insertStatement, 1, Int32(cruiseID))
            sqlite3_bind_text(insertStatement, 2, (cruiseName as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 3, Int32(cruisePrice))
            
            // Executing the query and checking for success.
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Cruise added successfully.")
            } else {
                print("Error: Failed to add a new cruise.")
            }
        } else {
            print("Error: Unable to prepare the insert statement.")
        }
        
        // Finalizing the SQLite statement.
        sqlite3_finalize(insertStatement)
    }
    
    // Function to retrieve all cruise records from the Cruises table.
    func readCruises() -> [CruiseDB] {
        let queryStatementString = "SELECT * FROM Cruises;"
        
        // OpaquePointer to represent the SQLite statement.
        var queryStatement: OpaquePointer? = nil
        
        // Array to store cruise records.
        var cruisesArray: [CruiseDB] = []
        
        // Preparing and executing the SQLite query.
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            // Looping through each row of the result set.
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                // Extracting data from the result set columns.
                let cruiseID = Int(sqlite3_column_int(queryStatement, 0))
                let cruiseName = String(cString: sqlite3_column_text(queryStatement, 1))
                let cruisePrice = Int(sqlite3_column_int(queryStatement, 2))
                
                // Creating a CruiseDB object and adding it to the array.
                let cruise = CruiseDB(cruiseID: cruiseID, cruiseName: cruiseName, cruisePrice: cruisePrice)
                cruisesArray.append(cruise)
                
                // Printing cruise details (for demonstration purposes).
                print("Cruise Details:")
                print("ID: \(cruiseID), Name: \(cruiseName), Price:\(cruisePrice)")
            }
        } else {
            print("Error: Unable to prepare the select statement.")
        }
        
        // Finalizing the SQLite statement.
        sqlite3_finalize(queryStatement)
        
        // Returning the array of cruise records.
        return cruisesArray
    }
}

