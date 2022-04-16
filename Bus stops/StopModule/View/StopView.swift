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

    let cellId = "Cell"
    
    let map: MKMapView = {
        let controller = MKMapView()
        controller.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()
    
    let nameLabel: UILabel = {
        let controller = UILabel()
        controller.font = UIFont.boldSystemFont(ofSize: 25.0)
        controller.numberOfLines = 2
        controller.translatesAutoresizingMaskIntoConstraints = false
        controller.adjustsFontSizeToFitWidth = true
        return controller
    }()
    
    let viewBack: UIView = {
        let c = UIView()
        c.layer.cornerRadius = 20
        c.backgroundColor = .systemBackground
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()
    
    let notRoutLabel : UILabel = {
        let notRoutLabel = UILabel()
        notRoutLabel.text = "К сожелению, у нас нет данных о маршрутах на этой остановки."
        notRoutLabel.numberOfLines = 3
        notRoutLabel.adjustsFontSizeToFitWidth = true
        notRoutLabel.translatesAutoresizingMaskIntoConstraints = false
        return notRoutLabel
    }()
    
    let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 70, height: 60)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor =  UIColor(white: 1, alpha: 0)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        presenter.setStopInfo()
    }
// MARK: - Config UI
    func configUI(){
        // Config map
        view.addSubview(map)
        map.frame = view.frame
        
        // Config viewBack
        view.addSubview(viewBack)
        viewBack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        viewBack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        viewBack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        viewBack.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        // Config name
        viewBack.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: viewBack.topAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: viewBack.leftAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: viewBack.rightAnchor, constant: -10).isActive = true
        
    }

}

extension StopView: StopViewProtocol {
    
    func noRoutes() {
        viewBack.addSubview(notRoutLabel)
        notRoutLabel.leadingAnchor.constraint(equalTo: viewBack.leadingAnchor, constant: 10).isActive = true
        notRoutLabel.trailingAnchor.constraint(equalTo: viewBack.trailingAnchor, constant: -10).isActive = true
        notRoutLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        notRoutLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
    }
    
     func configCollectionView() {
         collectionView.dataSource = self
         collectionView.register(RouteView.self, forCellWithReuseIdentifier: cellId)
         viewBack.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: viewBack.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: viewBack.trailingAnchor, constant: -10).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        collectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    func succes() {
        collectionView.reloadData()
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

extension StopView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.routes?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RouteView
        if let rout = presenter.routes?[indexPath.row] {
            cell.numberLabel.text = rout.number
            if rout.isGreen {
                cell.timeLabel.textColor = .systemGreen
            }
            cell.numberLabel.backgroundColor = UIColor(hexString: rout.color)
            cell.numberLabel.textColor = UIColor(hexString: rout.fontColor)
            cell.timeLabel.text = rout.timeArrival.first
            cell.layer.masksToBounds = true
        }
        
        return cell
    }
}

