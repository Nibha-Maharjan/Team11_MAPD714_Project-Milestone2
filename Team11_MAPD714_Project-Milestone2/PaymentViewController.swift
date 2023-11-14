//
//  PaymentViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-12.
//
// Team 11
// Saurav Gautam - 301286980
// Nibha Maharjan - 301282952
//
// Project- 1
// Milestone - 3
//
// This is project on Cruise booking app. We have to create UI and functionality from scratch using everything we
// learned in class and other resources found via books or online.



import UIKit

class PaymentViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var TextFieldWan: UITextField!
    @IBOutlet weak var TextFieldTwo: UITextField!
    @IBOutlet weak var TextFieldTres: UITextField!
    @IBOutlet weak var Fullname: UITextField!
    @IBOutlet weak var Address: UITextField!
    var NoGuest: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        TextFieldWan.delegate = self
        TextFieldTwo.delegate = self
        TextFieldTres.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // For mobile number validation
        let allowedCharacters = CharacterSet(charactersIn: "+0123456789/ ") // Change this based on your requirement
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    @IBAction func buttonClickedConfirmPayment(_ sender: UIButton) {
        
        let control=storyboard?.instantiateViewController(withIdentifier: "OutputViewController")as!OutputViewController
                    
                
                    //pass data from first view to second view
        control.GuestNum=NoGuest
        control.GuestName=Fullname.text
        control.GuestAdd=Address.text
        
    
                    
                    present(control, animated: true)
        
    }
    

}
