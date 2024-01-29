//
//  City.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 15/01/2024.
//

import UIKit
import CoreLocation

struct City {
    let id = UUID()
    let name: String
    let coordinates: CLLocationCoordinate2D
}
