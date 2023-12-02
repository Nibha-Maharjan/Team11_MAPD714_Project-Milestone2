//
//  SavedTabViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-10-30.
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




import UIKit
import WebKit

class SavedTabViewController: UIViewController {

    //define a webview control object
    let wview = WKWebView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add the object into view
        view.addSubview(wview)
        
        //define the url object with the website/domaain name
        guard let url = URL(string: "https://www.cruisetraveloutlet.com/blog/best-cruise-destinations-in-the-world/")
        else{
            return
        }
        
        //load the url into web view control
        wview.load(URLRequest(url: url))
        
        
    }
    
    //initializing web view to the screen
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        wview.frame = view.bounds
    }


}
