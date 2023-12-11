//
//  LoginViewController.swift
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
// there is tabs for featured which is the home screen then other tabs for deals, search and account.
// there are individual pages for cruises.

import UIKit

class LoginViewController: UIViewController {

    //UI elements - Email and Password text fields
    @IBOutlet weak var customerLoginEmailTxt: UITextField!
    
    @IBOutlet weak var customerLoginPasswordTxt: UITextField!
    
    // MARK: - Properties
        
        // ClientsDBManager database instance
        var clientsDBManager = ClientsDBManager()
        var customersArray = [RegistrationDB]()

       
        override func viewDidLoad() {
            super.viewDidLoad()
        }

        
    // MARK: - Actions
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        // Checking if both email and password are provided
        guard let email = customerLoginEmailTxt.text, let password = customerLoginPasswordTxt.text else {
            showAlert(with: "Error", message: "Please enter both email and password.")
            return
        }

        // ClientsDBManager database code


        // Checking if the user with provided email and password exists
        if clientsDBManager.authenticateUser(email: email, password: password) {

            // User authentication successful then Navigating to the home screen
            let control = storyboard?.instantiateViewController(withIdentifier: "tabview") as! UITabBarController
            //present(control, animated: true)
            self.navigationController?.pushViewController(control, animated: true)
            
            
            
            
        } else {
            // User authentication failed
            showAlert(with: "Authentication Failed", message: "Invalid email or password.")
        }
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
