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

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var ifSeniorSwitch: UISwitch!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var numberTextField2: UITextField!
    @IBOutlet weak var totalPriceCruise: UILabel!
    @IBOutlet weak var adultCal: UILabel!
    @IBOutlet weak var childCal: UILabel!

    // MARK: - Properties

    var selectedCruise: DetailsCruise?
    var selectedDate: String?

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialView()
        setupTargets()
    }

    // MARK: - Setup Functions

    private func setupInitialView() {
        ifSeniorSwitch.isOn = false
        datePicker.datePickerMode = .date
        datePicker.date = Date() // Set to today's date

        formatDateAndSetSelectedDate()
        updateTotalPrice()
    }

    private func setupTargets() {
        datePicker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
        numberTextField.addTarget(self, action: #selector(passengerCountChanged(_:)), for: .editingChanged)
        numberTextField2.addTarget(self, action: #selector(passengerCountChanged(_:)), for: .editingChanged)
    }

    // MARK: - Actions

    @objc private func passengerCountChanged(_ textField: UITextField) {
        updateTotalPrice()
    }

    @objc private func datePickerChanged(picker: UIDatePicker) {
        formatDateAndSetSelectedDate()
    }

    private func updateTotalPrice() {
        let adultCount = calculateTotal(count: numberTextField.text ?? "0", price: selectedCruise?.cruisePrice)
        let childCount = calculateTotal(count: numberTextField2.text ?? "0", price: selectedCruise?.cruisePrice)

        adultCal.text = "\(selectedCruise?.cruisePrice ?? "0") * \(numberTextField.text ?? "0") = \(adultCount)"
        childCal.text = "\(selectedCruise?.cruisePrice ?? "0") * \(numberTextField2.text ?? "0") = \(childCount)"
        totalPriceCruise.text = String(childCount + adultCount)
    }

    private func calculateTotal(count: String, price: String?) -> Int {
        let countInt = Int(count) ?? 0
        let priceInt = Int(price ?? "0") ?? 0
        return countInt * priceInt
    }

    // MARK: - Navigation

    @IBAction func buttonClickedPersonCountNext(_ sender: UIButton) {
        if isValidForNavigation() {
            navigateToPayment()
        } else {
            showAlert(message: "Please enter the number of adults or children.")
        }
    }

    // MARK: - Helper Functions

    private func formatDateAndSetSelectedDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        selectedDate = dateFormatter.string(from: datePicker.date)
    }

    private func isValidForNavigation() -> Bool {
        let adultCountValue = Int(numberTextField.text ?? "0") ?? 0
        let childCountValue = Int(numberTextField2.text ?? "0") ?? 0
        return adultCountValue > 0 || childCountValue > 0
    }

    private func navigateToPayment() {
        let storyboard = UIStoryboard(name:"Main", bundle:nil)
        let toPayment = storyboard.instantiateViewController(withIdentifier: "toPaymentViewController") as! toPaymentViewController
        toPayment.modalPresentationStyle = .fullScreen
        toPayment.selectedCruise = selectedCruise
        let adultCountValue = Int(numberTextField.text ?? "0") ?? 0
        let childCountValue = Int(numberTextField2.text ?? "0") ?? 0
        let defaults = UserDefaults.standard

        defaults.set(selectedDate, forKey: "date")
        defaults.set(ifSeniorSwitch.isOn, forKey: "seniorCitizenBoarding")
        defaults.set(adultCountValue, forKey: "adultCount")
        defaults.set(childCountValue, forKey: "childCount")
        defaults.set(totalPriceCruise.text, forKey: "totalPrice")
        self.navigationController?.pushViewController(toPayment, animated: true)
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}




    


