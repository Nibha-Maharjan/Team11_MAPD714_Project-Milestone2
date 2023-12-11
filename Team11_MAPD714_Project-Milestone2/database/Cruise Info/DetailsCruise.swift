//
//  DetailsCruise.swift
//  Team11_MAPD714_Project-Milestone2
//
//  Created by SAURAV on 2023-12-08.
//


import Foundation

struct DetailsCruise {
    let cruiseTitle: String
    let cruiseImage: String
    let cruiseDescription: String
    let cruiseDuration: String
    let visitingPlaces: String
    let cruisePrice: String
}

struct CruiseData {
    static let allCruises: [DecCruise] = [
        DecCruise(
            cruiseTitle: "Bahamas Cruise",
            cruiseImage: "BahamasFeatured",
            cruiseDescription: "Spend your time with us at the ocean. Centen Luxurious Voyage bring you:",
            cruiseDuration: "7 Nights 8 Days",
            visitingPlaces: "Miami, FL and Nassau, Bahamas",
            cruisePrice: "1200"
        ),
        DecCruise(
            cruiseTitle: "Caribbean Cruise",
            cruiseImage: "CaribbeanFeatured",
            cruiseDescription: "Spend your time with us at the ocean. Centen Luxurious Voyage bring you:",
            cruiseDuration: "10 Nights 11 Days",
            visitingPlaces: "Miami, FL and St. Thomas, Barbados, Antigua",
            cruisePrice: "1500"
        ),
        DecCruise(
            cruiseTitle: "Cuba Cruise",
            cruiseImage: "CubaFeatured",
            cruiseDescription: "Spend your time with us at the ocean. Centen Luxurious Voyage bring you:",
            cruiseDuration: "5 Nights 6 Days",
            visitingPlaces: "Tampa, FL and Havana, Cuba",
            cruisePrice: "900"
        ),
        DecCruise(
            cruiseTitle: "Sampler Cruise",
            cruiseImage: "SamplerFeatured",
            cruiseDescription: "Spend your time with us at the ocean. Centen Luxurious Voyage bring you:",
            cruiseDuration: "4 Nights 5 Days",
            visitingPlaces: "Galveston, TX and Cozumel, Mexico",
            cruisePrice: "800"
        ),
        DecCruise(
            cruiseTitle: "Star Cruise",
            cruiseImage: "StarFeatured",
            cruiseDescription: "Spend your time with us at the ocean. Centen Luxurious Voyage bring you:",
            cruiseDuration: "3 Nights 4 Days",
            visitingPlaces: "Orlando, FL and Port Canaveral, FL",
            cruisePrice: "700"
        )
    ]
}

