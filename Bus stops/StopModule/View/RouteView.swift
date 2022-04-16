//
//  MyCell.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 16.04.2022.
//

import UIKit

class RouteView: UICollectionViewCell
{
    let numberLabel: UILabel = {
        let control = UILabel()
        control.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        control.textAlignment = .center
        control.adjustsFontSizeToFitWidth = true
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    

    let timeLabel: UILabel = {
        let control = UILabel()
        control.font = UIFont.systemFont(ofSize: 15)
        control.adjustsFontSizeToFitWidth = true
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        addSubview(numberLabel)
        numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -6).isActive =  true
        numberLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive =  true
        numberLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    
        addSubview(timeLabel)
        timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive =  true
        timeLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 3).isActive = true
    }
}
