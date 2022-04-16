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
        controller.font = UIFont.boldSystemFont(ofSize: 25.0)
        controller.numberOfLines = 0
        //        controller.textAlignment = .center
        return controller
    }()
    
    let stak: UIStackView = {
        let controller = UIStackView()
        controller.axis = .vertical
        controller.layer.cornerRadius = 20
        controller.alignment = .leading
        controller.spacing = 30
//        controller.distribution = .fill
        controller.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()
    
    let stakRoutes: UIStackView = {
        let controller = UIStackView()
        controller.axis = .horizontal
        controller.spacing = 20
        
//        controller.distribution  = UIStackView.Distribution.fill
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
        stak.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        stak.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        stak.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        stak.addArrangedSubview(nameLabel)
        stak.addArrangedSubview(stakRoutes)
        nameLabel.topAnchor.constraint(equalTo: stak.topAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: stak.leftAnchor, constant: 10).isActive = true
        stakRoutes.leftAnchor.constraint(equalTo: stak.leftAnchor, constant: 15).isActive = true
    }
}

extension StopView: StopViewProtocol {
    func succes() {
        if let routes = presenter.routes {
            for rout in routes {
                let routStack = UIStackView()
                routStack.axis = .vertical
                routStack.alignment = .fill
                let number = UILabel()
                number.text = rout.number
                let time = UILabel()
                let a = rout.timeArrival.first ?? "10 0"
                if let b = Int(a.split(separator: " ")[0]) {
                    if b < 5 {
                        time.textColor = .systemGreen
                    }
                } else {
                    time.textColor = .systemGreen
                }
                print("num = \(a)")
                number.font = UIFont.systemFont(ofSize: 25)
                number.numberOfLines = 0
                time.numberOfLines = 0
                time.font = UIFont.systemFont(ofSize: 15)
                time.text = rout.timeArrival.first
                routStack.addArrangedSubview(number)
                routStack.addArrangedSubview(time)
                stakRoutes.addArrangedSubview(routStack)
            }
        }

        stakRoutes.bottomAnchor.constraint(equalTo: stak.bottomAnchor, constant: 200).isActive = true
        stakRoutes.rightAnchor.constraint(equalTo: stak.rightAnchor, constant: 20).isActive = true
        stakRoutes.leftAnchor.constraint(equalTo: stak.leftAnchor, constant: 20).isActive = true
        stakRoutes.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        
    }
    
    func failer(error: Error) {
        print(error.localizedDescription)
    }
    
    
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
