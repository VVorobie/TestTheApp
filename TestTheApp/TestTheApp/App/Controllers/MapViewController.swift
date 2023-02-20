//
//  MapViewController.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 17.02.2023.
//

import UIKit
import MapKit

/// Контроллер изображения карты
final class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.region = MapData.region
        mapView.addAnnotations(MapData.annotations)
    }
}

extension MapViewController: MKMapViewDelegate {
    // Создание вью для аннотации
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        return MapMarkView(annotation: annotation, reuseIdentifier: nil)
    }
}
