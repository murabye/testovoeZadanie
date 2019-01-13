//
//  ViewController.swift
//  testApplication
//
//  Created by варя on 05/01/2019.
//  Copyright © 2019 варя. All rights reserved.
//

import UIKit

class MainView: UIViewController, MainViewProtocol {
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: MainPresenter!
    
    var data: [Section] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter()
        presenter.viewDelegate = self
        table.alpha = 0
    }
    
    func updateData(models: [Section]) {
        activityIndicator.stopAnimating()
        data = models
        table.reloadData()
        UIView.animate(withDuration: 0.5) { [unowned self] () in
            self.table.alpha = 1
        }
    }
    
    func handleError(_ error: Error) {
        let alert = UIAlertController(title: "Alert", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
            }}))
        self.present(alert, animated: true, completion: nil)
    }
  
    func present(viewController: UIViewController) {
        self.navigationController?.show(viewController, sender: nil)
    }
}

extension MainView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = data[indexPath.section].cells[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.presenter!.identifier)!
        let cellView = cell as! CellViewProtocol
        cellModel.presenter.cellDelegate = cellView
        cellModel.presenter.present()
        
        return cell
    }
}

extension MainView: UITableViewDelegate {}
