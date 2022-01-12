//
//  ListViewController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 12/01/22.
//

import UIKit

protocol ListViewControllerDelegate {
    func updateItem(_ item: String)
}

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: ListViewControllerDelegate?
    var listModel: ListModel?
    
    let cellReuseIdentifier = "cell"
    var listView : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let listModel = listModel,
        let citys = listModel.items,
        citys.count > 0 else {
            return
        }
        listView = citys
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    fileprivate func setList(_ selectedItem: String) {
        guard let delegate = delegate else {
            return
        }
        navigationController?.popViewController(animated: true)
        delegate.updateItem(selectedItem)
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        setList(listView[indexPath.row])
    }
}

extension ListViewController: UITableViewDataSource {
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

