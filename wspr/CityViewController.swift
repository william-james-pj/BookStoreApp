//
//  CityViewController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 12/01/22.
//

import UIKit

protocol CityViewControllerDelegate {
    func updateCity(_ city: String)
}

class CityViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: CityViewControllerDelegate?
    
    let cellReuseIdentifier = "cell"
    let listView : [String] = ["Cidade 1", "Cidade 2", "Cidade 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    fileprivate func setCity(_ selectedCity: String) {
        guard let delegate = delegate else {
            return
        }
        navigationController?.popViewController(animated: true)
        delegate.updateCity(selectedCity)
    }
}

extension CityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        setCity(listView[indexPath.row])
    }
}

extension CityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = listView[indexPath.row]
        cell.backgroundColor = UIColor.init(red: 0.223, green: 0.243, blue: 0.274, alpha: 1)
        cell.textLabel?.textColor = UIColor.white
        
        return cell
    }
    
}
