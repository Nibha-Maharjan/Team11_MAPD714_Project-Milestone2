//
//  PassengerCountViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-12.
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


import UIKit

class PassengerCountViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Outlets

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var ifSeniorSwitch: UISwitch!
    @IBOutlet weak var numberTextField2: UITextField!
    @IBOutlet weak var cruiseSelectedPassengerCountLbl: UILabel!
    @IBOutlet weak var cruisesIndivPrice: UILabel!
    @IBOutlet weak var datePickerBooking: UIDatePicker!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var ifSeniorLbl: UILabel!
    @IBOutlet weak var numKidsLbl: UILabel!
    @IBOutlet weak var numAdultLbl: UILabel!

    // MARK: - Properties

    var CruiseLbldata = ""
    var CruisePrice = ""

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set initial values and delegates
        setupUI()

        // Set up date picker value changed event
        datePickerBooking.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    }

    // MARK: - UI Setup

    private func setupUI() {
        cruiseSelectedPassengerCountLbl.text = "You have selected:  \(CruiseLbldata)"
        cruisesIndivPrice.text = " \(CruisePrice)"
        numberTextField.delegate = self
        numberTextField2.delegate = self
    }

    // MARK: - Text Field Delegate

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // For mobile number validation
        let allowedCharacters = CharacterSet(charactersIn: "+0123456789 ") // Change this based on your requirement
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }

    // MARK: - Date Picker Handling

    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none

        dateLbl.text = "Selected Date: \(dateFormatter.string(from: sender.date))"
    }

    // MARK: - Button Actions

    @IBAction func buttonClickedPersonCountNext(_ sender: UIButton) {
        let a = Int(numberTextField.text!) ?? 0
        let b = Int(numberTextField2.text!) ?? 0
        let totalGuest = a + b
        
        let totalPrice = totalGuest * (Int(CruisePrice) ?? 0)
        
        // Update UI labels
        numAdultLbl.text = "Number of Adults: \(a)"
        numKidsLbl.text = "Number of Kids: \(b)"
        ifSeniorLbl.text = ifSeniorSwitch.isOn ? "Senior Citizen on board" : "No Senior Citizen on board"

        // Navigate to PaymentViewController
        navigateToPayment(totalGuest: totalGuest, totalPrice: totalPrice)
    }

    // MARK: - Navigation

    private func navigateToPayment(totalGuest: Int, totalPrice: Int) {
        let control = storyboard?.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController

        // Pass data from the first view to the second view
        control.NoGuest = String(totalGuest)
        control.CruisePriceTotal = String(totalPrice)

        present(control, animated: true)
    }
}


    


