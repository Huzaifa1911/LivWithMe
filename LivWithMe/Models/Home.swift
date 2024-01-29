//
//  House.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 15/01/2024.
//

import UIKit

struct Home {
    let id = UUID()
    let name: String
    let description: String
    let images: [String]
    let price: CGFloat
    let bedroomCount: Int
    let bathroomCount: Int
    let rentDuration: String
    let distanceInKm: CGFloat // relative to user location
    let owner: Owner
    let location: City
}
