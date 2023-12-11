//
//  selCruiseViewController.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-12-08.
//

import UIKit

class selCruiseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // MARK: - Outlets
    @IBOutlet weak var imageCol: UICollectionView!
    @IBOutlet weak var cruiseDesc: UILabel!
    @IBOutlet weak var visitPlacesCru: UILabel!
    @IBOutlet weak var durCru: UILabel!
    @IBOutlet weak var priceCru: UILabel!
    @IBOutlet weak var myPage: UIPageControl!

    // MARK: - Properties
    // Array of image names for the cruise
    let imagesCollections: [String] = ["image1", "image2", "image3", "image4", "image5"]

    // Variable to hold the selected cruise details
    var selectedCruise: DetailsCruise?

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set initial page control properties
        myPage.currentPage = 0
        myPage.numberOfPages = imagesCollections.count

        // Setting up the collection view
        imageCol.dataSource = self
        imageCol.delegate = self

        // Populating the UI with the selected cruise details
        fillDetailsCruise()
    }

    // MARK: - Private Methods

    /// Update the UI elements with cruise details
    private func fillDetailsCruise() {
        cruiseDesc.text = selectedCruise?.cruiseDescription
        visitPlacesCru.text = selectedCruise?.visitingPlaces
        durCru.text = selectedCruise?.cruiseDuration
        priceCru.text = "Price: \(selectedCruise?.cruisePrice ?? "0")"
    }

    // MARK: - UICollectionViewDataSource

    /// Number of items in the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesCollections.count
    }

    /// Set up cells in the collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCol.dequeueReusableCell(withReuseIdentifier: "imageSlider", for: indexPath) as! CruiseCollectionViewCell

        // Configure the cell with the corresponding cruise image
        cell.cruiseImageColl.image = UIImage(named: imagesCollections[indexPath.row])
        cell.cruiseImageColl.layer.cornerRadius = 25.0

        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    /// Set item size in the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 500, height: 250)
    }

    /// Update page control with the current page when scrolling
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        myPage.currentPage = indexPath.row
    }

    // MARK: - Actions

    /// Navigate to the PassengerCountViewController when proceeding to payment
    @IBAction func proceedToPayment(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let passengerView = storyboard.instantiateViewController(withIdentifier: "PassengerCountViewController") as! PassengerCountViewController
        passengerView.modalPresentationStyle = .fullScreen
        passengerView.selectedCruise = selectedCruise
        self.navigationController?.pushViewController(passengerView, animated: true)
    }
}





