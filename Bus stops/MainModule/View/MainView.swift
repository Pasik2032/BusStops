//
//  ViewController.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 14.04.2022.
//

import UIKit

class MainView: UIViewController {
// MARK: - Fields
    var presenter: MainViewPresenterProtocol!
    
    
// MARK: - UI
    let tableView: UITableView = {
        let controller = UITableView()
        controller.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        controller.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()
    
    func configUI(){
        view.addSubview(tableView)
        tableView.frame = view.safeAreaLayoutGuide.layoutFrame
        tableView.dataSource = self
        tableView.delegate = self
    }
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Остановки"
        configUI()
        // Do any additional setup after loading the view.
    }
}
// MARK: - View
extension MainView: MainViewProtocol {
    func succes() {
        tableView.reloadData()
    }
    
    func failer(error: Error) {
        print(error.localizedDescription)
        let alert = UIAlertController(title: "Ошибка", message: "Не удалось получить данные с сервера", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Data Source
extension MainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.stops?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let stop = presenter.stops?[indexPath.row]
        cell.textLabel?.text = stop?.name
        return cell
    }
}

// MARK: -Table View Delegate
extension MainView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stop = presenter.stops?[indexPath.row]
        presenter.tobOnTheStop(stop: stop)
    }
}
