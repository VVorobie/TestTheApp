//
//  MapMarkView.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 17.02.2023.
//

import UIKit
import MapKit
/// Вью Аннотации для установки на крту
final class MapMarkView: MKAnnotationView {
    // Инициализатор  подключает изображение точки и смещает центр для точного указаня места
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        image = UIImage(named: "КартаЗ")
        centerOffset = CGPoint(x: 0, y: -bounds.height / 2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
