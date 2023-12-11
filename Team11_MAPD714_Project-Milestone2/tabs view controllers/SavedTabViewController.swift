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

    // MARK: - Properties
    /// Define a WKWebView control object
    let webView = WKWebView()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add the webView to the view
        view.addSubview(webView)

        // Define the URL object with the website/domain name
        guard let url = URL(string: "https://www.cruisetraveloutlet.com/blog/best-cruise-destinations-in-the-world/") else {
            return
        }

        // Load the URL into the webView control
        webView.load(URLRequest(url: url))
    }

    // MARK: - Layout
    // Initializing webView to the screen with specific padding
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // Define padding values for the top and bottom of the webView
        let topPadding: CGFloat = 90
        
        let bottomPadding: CGFloat = 100

        // Set the frame of the webView with specified padding
        webView.frame = CGRect(
            x: 0,
            y: topPadding,
            width: view.bounds.width,
            height: view.bounds.height - topPadding - bottomPadding
        )
    }
}

