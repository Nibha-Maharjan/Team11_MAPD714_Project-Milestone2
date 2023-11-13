//
//  PassengerCountViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-12.
//

import UIKit

class PassengerCountViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var numberTextField2: UITextField!
    @IBOutlet weak var cruiseSelectedPassengerCountLbl: UILabel!
    
    
    var CruiseLbldata = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cruiseSelectedPassengerCountLbl.text = "You have selected:  \(CruiseLbldata)"
        numberTextField.delegate = self
        numberTextField2.delegate = self
    }
   
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // For mobile number validation
        let allowedCharacters = CharacterSet(charactersIn: "+0123456789 ") // Change this based on your requirement
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }

    @IBAction func buttonClickedPersonCountNext(_ sender: UIButton) {
        let a=Int(numberTextField.text!)
        let b=Int(numberTextField2.text!)
        var TotalGuest=a!+b!
        let control=storyboard?.instantiateViewController(withIdentifier: "PaymentViewController")as!PaymentViewController
                    
        
                    //pass data from first view to second view
        control.NoGuest=String(TotalGuest)
        
    
                    
                    present(control, animated: true)
}
        
    }
    


