//
//  MyCell.swift
//  CollectionViewNisWs
//  Created by Dmitry Alexandrov
//
import UIKit

class MyCell: UICollectionViewCell
{
//    let profileImageButton: UIButton = {
//        let control = UIButton()
//        control.backgroundColor = UIColor.yellow //white
//        control.layer.cornerRadius = 4 // 18
//        control.clipsToBounds = false
//        control.setImage(UIImage(named: "Profile"), for: .normal)
//        control.translatesAutoresizingMaskIntoConstraints = false // required
//        return control
//    }()
    
    let dateLabel: UILabel = {
        let control = UILabel()
        control.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        control.textAlignment = .center
        control.textColor = UIColor.red
        control.backgroundColor = .yellow
        control.text = "30"
        control.adjustsFontSizeToFitWidth = true
        control.translatesAutoresizingMaskIntoConstraints = false // required
        return control
    }()
    
//    let dayLabel: UILabel = {
//        let control = UILabel()
//        control.font = UIFont.systemFont(ofSize: 12)
//        control.textAlignment = .center
//        control.textColor = UIColor.systemBlue
//        control.text = "Fri"
//        control.translatesAutoresizingMaskIntoConstraints = false // required
//        return control
//    }()

    let distanceLabel: UILabel = {
        let control = UILabel()
        control.font = UIFont.systemFont(ofSize: 15)
        control.textColor = UIColor.white //lightGray
        control.text = "2000 m"
        control.adjustsFontSizeToFitWidth = true
        control.translatesAutoresizingMaskIntoConstraints = false // required
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
//        backgroundColor = UIColor.blue //black
        
//        addSubview(profileImageButton)
        addSubview(dateLabel)
//        addSubview(dayLabel)
        addSubview(distanceLabel)

        dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -6).isActive =  true
        dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive =  true
        

        distanceLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive =  true
        distanceLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 3).isActive = true
    }
        
}
