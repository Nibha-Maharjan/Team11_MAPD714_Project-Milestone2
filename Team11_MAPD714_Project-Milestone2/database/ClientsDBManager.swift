//
//  ClientsDBManager.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-25.
//



import Foundation
import SQLite3

class ClientsDBManager {
    
    // MARK: - Initialization
    
    // Initializer for the ClientsDBManager class.
    // It opens the SQLite database and creates the necessary table.
    init() {
        db = openDatabase()
        createTable()
    }
    
    // MARK: - Database Handling
    
    // Database path used for SQLite storage.
    let dataPath: String = "CustomerInfoDB"
    
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
        }
        else {
            print("Database opened successfully.")
            return db
        }
    }
    
    // Function to create the necessary table (CustomerInfo) if it doesn't exist.
    func createTable() {
        // SQLite query to create the CustomerInfo table with appropriate columns.
        let createTableString = """
            CREATE TABLE IF NOT EXISTS CustomerInfo (
                customerID INTEGER PRIMARY KEY,
                customerFullName TEXT,
                customerEmail TEXT,
                customerPassword TEXT,
                customerAge INTEGER,
                customerAddress TEXT
            );
        """
        
        // OpaquePointer to represent the SQLite statement.
        var createTableStatement: OpaquePointer? = nil
        
        // Preparing and executing the SQLite query.
        if sqlite3_prepare(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            // Executing the query and checking for success.
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Table 'CustomerInfo' created successfully.")
            }
            else {
                print("Error: Failed to create table 'CustomerInfo'.")
            }
        }
        else {
            print("Error: Unable to prepare the create table statement.")
        }
        
        // Finalizing the SQLite statement.
        sqlite3_finalize(createTableStatement)
    }
    
    // MARK: - Database Operations
    
    // Function to insert a new customer record into the CustomerInfo table.
    func insert(customerID: Int, customerFullName: String, customerEmail: String, customerPassword: String, customerAge: Int, customerAddress: String) {
        // SQLite query to insert a new row into the CustomerInfo table.
        let insertStatementString = """
            INSERT INTO CustomerInfo (
                customerID, customerFullName, customerEmail,
                customerPassword, customerAge, customerAddress
            ) VALUES (?, ?, ?, ?, ?, ?);
        """
        
        // OpaquePointer to represent the SQLite statement.
        var insertStatement: OpaquePointer? = nil
        
        // Preparing and executing the SQLite query.
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            // Binding parameters to the SQLite statement.
            sqlite3_bind_int(insertStatement, 1, Int32(customerID))
            sqlite3_bind_text(insertStatement, 2, (customerFullName as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (customerEmail as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (customerPassword as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 5, Int32(customerAge))
            sqlite3_bind_text(insertStatement, 6, (customerAddress as NSString).utf8String, -1, nil)
            
            // Executing the query and checking for success.
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Customer added successfully.")
            } else {
                print("Error: Failed to add a new customer.")
            }
        } else {
            print("Error: Unable to prepare the insert statement.")
        }
        
        // Finalizing the SQLite statement.
        sqlite3_finalize(insertStatement)
    }
    
    
    
    
    // Function to retrieve a customer by email from the CustomerInfo table.
    func getCustomerByEmail(email: String) -> RegistrationDB? {
        // OpaquePointer to represent the SQLite statement.
        var getStatement: OpaquePointer?
        
        // SQLite query to select a customer by email.
        let getStatementString = "SELECT * FROM CustomerInfo WHERE customerEmail = ?"
        
        // Prepare the SQLite query.
        if sqlite3_prepare_v2(db, getStatementString, -1, &getStatement, nil) == SQLITE_OK {
            // Bind the email parameter to the SQLite statement.
            sqlite3_bind_text(getStatement, 1, (email as NSString).utf8String, -1, nil)
            
            // Check if the query returns a row (customer with the provided email).
            if sqlite3_step(getStatement) == SQLITE_ROW {
                // Extracting data from the result set columns.
                let customerID = Int(sqlite3_column_int(getStatement, 0))
                let customerFullName = String(describing: String(cString: sqlite3_column_text(getStatement, 1)))
                let customerEmail = String(describing: String(cString: sqlite3_column_text(getStatement, 2)))
                let customerPassword = String(describing: String(cString: sqlite3_column_text(getStatement, 3)))
                let customerAge = Int(sqlite3_column_int(getStatement, 4))
                let customerAddress = String(describing: String(cString: sqlite3_column_text(getStatement, 5)))
                
                // Create a RegistrationDB object with the retrieved data.
                let registrationDB = RegistrationDB(customerID: customerID, customerFullName: customerFullName, customerEmail: customerEmail, customerPassword: customerPassword, customerAge: customerAge, customerAddress: customerAddress)
                
                // Check if there are additional rows (there shouldn't be).
                if sqlite3_step(getStatement) != SQLITE_DONE {
                    let errorMessage = String(cString: sqlite3_errmsg(db))
                    print("Error getting customer info: \(errorMessage)")
                }
                
                // Finalize the SQLite statement.
                sqlite3_finalize(getStatement)
                
                // Return the RegistrationDB object representing the customer.
                return registrationDB
            }
        }
        
        // If no customer found, return nil.
        return nil
    }


    
    
    // Function to update customer information in the CustomerInfo table.
    func updateCustomer(registrationDB: RegistrationDB) {
        // OpaquePointer to represent the SQLite statement.
        var updateStatement: OpaquePointer?
        
        // SQLite query to update customer information.
        let updateStatementString = "UPDATE CustomerInfo SET customerPassword = ?, customerAddress = ? "
        
        // Prepare the SQLite query.
        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
            // Bind parameters to the SQLite statement.
            sqlite3_bind_text(updateStatement, 1, (registrationDB.customerPassword as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 2, (registrationDB.customerAddress as NSString).utf8String, -1, nil)
            
            
            // Execute the query and check for errors.
            if sqlite3_step(updateStatement) != SQLITE_DONE {
                let errorMessage = String(cString: sqlite3_errmsg(db))
                print("Error updating customer info: \(errorMessage)")
            }
        }
        
        // Finalize the SQLite statement.
        sqlite3_finalize(updateStatement)
    }

    
    
    
    
    
    
    // Function to retrieve all customer records from the CustomerInfo table.
    func read() -> [RegistrationDB] {
        // SQLite query to select all records from the CustomerInfo table.
        let queryStatementString = "SELECT * FROM CustomerInfo;"
        
        // OpaquePointer to represent the SQLite statement.
        var queryStatement: OpaquePointer? = nil
        
        // Array to store customer records.
        var customersArray: [RegistrationDB] = []
        
        // Preparing and executing the SQLite query.
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            // Looping through each row of the result set.
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                // Extracting data from the result set columns.
                let customerID = Int(sqlite3_column_int(queryStatement, 0))
                let customerFullName = String(cString: sqlite3_column_text(queryStatement, 1))
                let customerEmail = String(cString: sqlite3_column_text(queryStatement, 2))
                let customerPassword = String(cString: sqlite3_column_text(queryStatement, 3))
                let customerAge = Int(sqlite3_column_int(queryStatement, 4))
                let customerAddress = String(cString: sqlite3_column_text(queryStatement, 5))
                
                // Creating a RegistrationDB object and adding it to the array.
                let customer = RegistrationDB(customerID: customerID, customerFullName: customerFullName, customerEmail: customerEmail, customerPassword: customerPassword, customerAge: customerAge, customerAddress: customerAddress)
                customersArray.append(customer)
                
                // Printing customer details (for demonstration purposes).
                print("CustomerInfo Details:")
                print("ID: \(customerID), Name: \(customerFullName), Email: \(customerEmail), Age: \(customerAge), Address: \(customerAddress)")
            }
        } else {
            print("Error: Unable to prepare the select statement.")
        }
        
        // Finalizing the SQLite statement.
        sqlite3_finalize(queryStatement)
        
        // Returning the array of customer records.
        return customersArray
    }
    
    // Function to authenticate a user based on email and password
    func authenticateUser(email: String, password: String) -> Bool {
        // SQLite query to check if a user with the provided email and password exists
        let queryStatementString = "SELECT * FROM CustomerInfo WHERE customerEmail = ? AND customerPassword = ? LIMIT 1;"
        
        // OpaquePointer to represent the SQLite statement.
        var queryStatement: OpaquePointer? = nil
        
        // Preparing and executing the SQLite query.
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            // Binding parameters to the SQLite statement.
            sqlite3_bind_text(queryStatement, 1, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(queryStatement, 2, (password as NSString).utf8String, -1, nil)
            
            // Checking if the query returns a row (user with provided email and password)
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                // User authenticated successfully
                return true
            }
        }
        
        // Finalizing the SQLite statement.
        sqlite3_finalize(queryStatement)
        
        // User authentication failed
        return false
    }
}




