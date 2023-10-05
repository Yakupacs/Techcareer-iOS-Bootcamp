//
//  ViewController.swift
//  LocationUsage
//
//  Created by Yakup on 5.10.2023.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

	@IBOutlet weak var enlemLabel: UILabel!
	@IBOutlet weak var mapView: MKMapView!
	@IBOutlet weak var boylamLabel: UILabel!
	@IBOutlet weak var hizLabel: UILabel!

	var locationManager = CLLocationManager()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// GPS hassasiyetini belirtir. Ne kadar hassassa o kadar batarya tüketir.
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		
		locationManager.requestWhenInUseAuthorization()
		locationManager.startUpdatingLocation()
		locationManager.delegate = self
		
//		let location = CLLocationCoordinate2D(latitude: 41.0349999, longitude: 28.964421)
//		let zoom = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
//		let region = MKCoordinateRegion(center: location, span: zoom)
//		mapView.setRegion(region, animated: true)
//		
//		let pin = MKPointAnnotation()
//		pin.coordinate = location
//		pin.title = "Istanbul"
//		pin.subtitle = "Taksim"
//		mapView.addAnnotation(pin)
	}


}

extension ViewController: CLLocationManagerDelegate{
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		let lastLocation = locations[locations.count - 1]
		
		let latitude = lastLocation.coordinate.latitude
		let longitude = lastLocation.coordinate.longitude
		
		enlemLabel.text = "Enlem: \(latitude)"
		boylamLabel.text = "Boylam: \(longitude)"
		hizLabel.text = "Hız: \(lastLocation.speed)"
		
		let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
		let zoom = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
		let region = MKCoordinateRegion(center: location, span: zoom)
		mapView.setRegion(region, animated: true)
		
		let pin = MKPointAnnotation()
		pin.coordinate = location
		pin.title = "Location"
		pin.subtitle = "\(latitude) - \(longitude)"
		mapView.addAnnotation(pin)

		mapView.showsUserLocation = true
	}
}
