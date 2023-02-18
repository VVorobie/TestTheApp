//
//  MapData.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 17.02.2023.
//

import Foundation
import MapKit

struct MapData {
    static var points = [
        CLLocationCoordinate2D(latitude: 60, longitude: 29),
        CLLocationCoordinate2D(latitude: 59.896701, longitude: 30.677912),
        CLLocationCoordinate2D(latitude: 61, longitude: 31),
        CLLocationCoordinate2D(latitude: 61, longitude: 30),
        CLLocationCoordinate2D(latitude: 58, longitude: 29)
    ]

    static var region:MKCoordinateRegion = {
        var latMin: CLLocationDegrees = 90
        var latMax: CLLocationDegrees = -90
        var lonMin: CLLocationDegrees = 180
        var lonMax: CLLocationDegrees = -180
        for point in points {
            if point.latitude < latMin {latMin = point.latitude}
            if point.latitude > latMax {latMax = point.latitude}
            if point.longitude < lonMin {lonMin = point.longitude}
            if point.longitude > lonMax {lonMax = point.longitude}
        }
        let latSpam = (latMax - latMin)/2
        let lonSpam = (lonMax - lonMin)/2
        let center = CLLocationCoordinate2D(latitude: latMin + latSpam, longitude: lonMin + lonSpam)
        let span = MKCoordinateSpan(latitudeDelta: 2.2 * latSpam, longitudeDelta: 2.2 * lonSpam)
        return MKCoordinateRegion(center: center, span: span)
    }()
    
    static var annotations: [MKAnnotation] = {
        var array: [MKAnnotation] = []
        for point in points {
            let annotation = Annotation(coordinate: point)
            array.append(annotation)
        }
        return array
    }()
}
     
final class Annotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
         
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init()
    }
}
