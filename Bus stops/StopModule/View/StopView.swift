//
//  StopView.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 14.04.2022.
//

import UIKit
import MapKit

class StopView: UIViewController{
    
    var presenter: StopViewPresenterProtocol!
    
    let map: MKMapView = {
        let controller = MKMapView()
        controller.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()
    
    let stak: UIStackView = {
        let controller = UIStackView()
        controller.translatesAutoresizingMaskIntoConstraints = false
        let label = UILabel()
        label.text = "aaaaaaaaa"
        controller.addSubview(label)
        let labelb = UILabel()
        labelb.text = "bbb"
        controller.addSubview(labelb)
        let labelc = UILabel()
        labelc.text = "cccccccccccc"
        controller.addSubview(labelc)
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        presenter.setStopInfo()
    }
    
    func configUI(){
        view.addSubview(map)
        map.frame = view.frame
    }
}

extension StopView: StopViewProtocol {
    
    func setMap(coordinate: CLLocationCoordinate2D) {
        let annotations = MKPointAnnotation()
        annotations.coordinate = coordinate
        map.showAnnotations([annotations], animated: true)
    }
    
    func setData(name: String) {
        print(name)
    }
}
