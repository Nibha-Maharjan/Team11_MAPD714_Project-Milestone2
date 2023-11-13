//
//  PaymentViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-12.
//

import UIKit

class PaymentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
    @IBAction func buttonClickedConfirmPayment(_ sender: UIButton) {
        
        let dataSndPayment = self.storyboard?.instantiateViewController(withIdentifier: "OutputViewController") as! OutputViewController

        
        self.navigationController?.pushViewController(dataSndPayment, animated: true)
        
    }
    

}
