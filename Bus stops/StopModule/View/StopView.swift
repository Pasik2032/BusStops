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
    
    let nameLabel: UILabel = {
        let controller = UILabel()
        controller.textAlignment = .center
        return controller
    }()
    
    let stak: UIStackView = {
        let controller = UIStackView()
        controller.layer.cornerRadius = 40
        controller.translatesAutoresizingMaskIntoConstraints = false
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
        view.addSubview(stak)
        stak.backgroundColor = .systemBackground
        stak.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        stak.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        stak.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        stak.heightAnchor.constraint(equalToConstant: view.frame.height / 4).isActive = true
        stak.addArrangedSubview(nameLabel)
    }
}

extension StopView: StopViewProtocol {
    
    func setMap(coordinate: CLLocationCoordinate2D) {
        let annotations = MKPointAnnotation()
        annotations.coordinate = coordinate
        map.showAnnotations([annotations], animated: true)
    }
    
    func setData(name: String) {
        nameLabel.text = name
        print(name)
    }
}
