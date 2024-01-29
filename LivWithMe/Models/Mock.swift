//
//  Mock.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 17/01/2024.
//

import Foundation
import CoreLocation

struct MockData {
    static let filters: [Category] =  [
        Category(name: "House"),
        Category(name: "Apartment"),
        Category(name: "Hotel"),
        Category(name: "Villa"),
        Category(name: "Cottage"),
        Category(name: "Hostel"),
    ]
    
    static let homes: [Home] = [
        Home(
            name: "Orchard House",
            description: "The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars",
            images: [
                "https://images.unsplash.com/photo-1512917774080-9991f1c4c750",
                "https://images.unsplash.com/photo-1512917774080-9991f1c4c750",
                "https://images.unsplash.com/photo-1512917774080-9991f1c4c750",
                "https://images.unsplash.com/photo-1512917774080-9991f1c4c750",
                "https://images.unsplash.com/photo-1512917774080-9991f1c4c750",
                "https://images.unsplash.com/photo-1512917774080-9991f1c4c750",
            ],
            price: 20000,
            bedroomCount: 5,
            bathroomCount: 4,
            rentDuration: "Year",
            distanceInKm: 1.8,
            owner: Owner(name: "Garry Allen", profileImage: "https://images.unsplash.com/photo-1552058544-f2b08422138a", phoneNumber: "03312220373"),
            location: City(name: "Jakarta", coordinates: CLLocationCoordinate2D(latitude: 31.5204, longitude: 74.3587))
        ),
        
        Home(
            name: "Orchard House",
            description: "The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars",
            images: [
                "https://images.unsplash.com/photo-1512917774080-9991f1c4c750",
            ],
            price: 20000,
            bedroomCount: 5,
            bathroomCount: 4,
            rentDuration: "Year",
            distanceInKm: 1.8,
            owner: Owner(name: "Garry Allen", profileImage: "https://images.unsplash.com/photo-1552058544-f2b08422138a", phoneNumber: "03312220373"),
            location: City(name: "Jakarta", coordinates: CLLocationCoordinate2D(latitude: 31.5204, longitude: 74.3587))
        ),
        
        Home(
            name: "Orchard House",
            description: "The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars",
            images: [
                "https://images.unsplash.com/photo-1512917774080-9991f1c4c750",
                "https://images.unsplash.com/photo-1512917774080-9991f1c4c750",
                "https://images.unsplash.com/photo-1512917774080-9991f1c4c750",
                "https://images.unsplash.com/photo-1512917774080-9991f1c4c750",
            ],
            price: 20000,
            bedroomCount: 5,
            bathroomCount: 4,
            rentDuration: "Year",
            distanceInKm: 1.8,
            owner: Owner(name: "Garry Allen", profileImage: "https://images.unsplash.com/photo-1552058544-f2b08422138a", phoneNumber: "03312220373"),
            location: City(name: "Jakarta", coordinates: CLLocationCoordinate2D(latitude: 31.5204, longitude: 74.3587))
        )
    ]
}
