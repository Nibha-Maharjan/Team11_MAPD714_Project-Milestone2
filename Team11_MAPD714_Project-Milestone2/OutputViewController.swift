//
//  OutputViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-11-12.
//

import UIKit

class OutputViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonClickedReturnHome(_ sender: UIButton) {
        
        let dataSndOutput = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController

        
        self.navigationController?.pushViewController(dataSndOutput, animated: true)
        
    }
    

}
