//
//  HomeLocationView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 25/01/2024.
//

import UIKit
import MapKit

class HomeLocationView: UIView {
    private var city: City
    
    private lazy var mapView: MKMapView = {
        let view = MKMapView()
        let annotation = MKPointAnnotation(__coordinate: city.coordinates, title: city.name, subtitle: "")
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: city.coordinates, span: span)
        view.setRegion(region, animated: true)
        view.addAnnotation(annotation)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(for city: City) {
        self.city = city
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

