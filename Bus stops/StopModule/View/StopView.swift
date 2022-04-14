//
//  StopView.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 14.04.2022.
//

import UIKit

class StopView: UIViewController{
    
    var presenter: StopViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setStopInfo()
    }
}

extension StopView: StopViewProtocol {
    func setData(name: String) {
        print(name)
    }
}
