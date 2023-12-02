//
//  RegistrationViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-10-29.
//

// Team 11
// Saurav Gautam - 301286980
// Nibha Maharjan - 301282952
//
// Project- 1
// Milestone - 4
//
// This is project on Cruise booking app. We have to create UI and functionality from scratch using everything we
// learned in class and other resources found via books or online.
//
// Cruise app will have several views for various functionality.
// there is splash screen, a starting screen which has buttons for browse, login and register.
// there is tabs for featured which is the home screen then other tabs for deals, search, saved and account.
// there are individual pages for cruises.



//to manage the registration process


import UIKit

class RegistrationViewController: UIViewController {
    
    //UI elements
    
    @IBOutlet weak var clientFullNameTxt: UITextField!
    
    @IBOutlet weak var clientAgeTxt: UITextField!
    
    @IBOutlet weak var clientAddressTxt: UITextField!
    
    @IBOutlet weak var clientEmailTxt: UITextField!
    
    @IBOutlet weak var clientPasswordTxt: UITextField!
    
    // MARK: - Properties
        
        // ClientsDBManager database instance
        var clientsDBManager = ClientsDBManager()
        var customersArray = [RegistrationDB]()
        

        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        // MARK: - Actions
    
    @IBAction func RegisterButtonOnClicked(_ sender: Any) {
        
        // Checking if all required fields are filled

                guard let fullName = clientFullNameTxt.text,
                      let email = clientEmailTxt.text,
                      let password = clientPasswordTxt.text,
                      let ageString = clientAgeTxt.text,
                      let age = Int(ageString),
                      let address = clientAddressTxt.text
                else {

                    showAlert(with: "Error", message: "Please fill in all fields.")
                    return
                }

                // ClientsDBManager database code
                // Inserting customer information into the database

                // Generating a unique customerID 
                let customerID = Int(Date().timeIntervalSince1970)

                clientsDBManager.insert(customerID: customerID, customerFullName: fullName, customerEmail: email, customerPassword: password, customerAge: age, customerAddress: address)

                // Reading updated customer information from the database
                customersArray = clientsDBManager.read()
                
                // Displaying a welcome alert
                showAlert(with: "Welcome!", message: "Welcome, \(fullName)! Please login to continue.")
            }

            // MARK: - Helper Functions
            
            // Function to show an alert with a given title and message
            func showAlert(with title: String, message: String) {

                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)

                alertController.addAction(okAction)

                present(alertController, animated: true, completion: nil)
            }
        }
