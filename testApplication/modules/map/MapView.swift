//
//  MapView.swift
//  testApplication
//
//  Created by варя on 09/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import UIKit
import MapKit

class MapView: UIViewController, MapViewProtocol {
    
    @IBOutlet weak var myMap: MKMapView!
    var presenter: MapPresenterProtocol!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }

    func show(lat: Double, long: Double, title: String, subTitle: String) {
         let initialLocation = CLLocation(latitude: lat, longitude: long)
         let regionRadius: CLLocationDistance = 1000
        
         let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
         myMap.setRegion(coordinateRegion, animated: true)
        
         let pin = MapPin(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long), title: title, subtitle: subTitle)
 
         myMap.addAnnotation(pin)
        
    }
    
    static func createModule() -> MapView {
        let sb = UIStoryboard.init(name: "Map", bundle: .main)
        let mapView = sb.instantiateInitialViewController() as! MapView
        let presenter = MapPresenter()
        presenter.viewDelegate = mapView
        presenter.model = MapModel()
        presenter.model.presenterDelegate = presenter
        mapView.presenter = presenter
        
        return mapView
    }
}

class MapPin: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
