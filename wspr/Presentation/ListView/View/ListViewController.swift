//
//  ListViewController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 12/01/22.
//

import UIKit

protocol ListViewControllerDelegate {
    func updateItem(_ item: ItemModel)
}

class ListViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var delegate: ListViewControllerDelegate?
    var listView : [ItemModel] = []
    
    // MARK: - Constantes
    let cellReuseIdentifier = "CustomTableViewCell"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Setup
    fileprivate func setupTableView() {
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Methods
    fileprivate func setList(_ selectedItem: ItemModel) {
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
        guard let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setData(listView[indexPath.row])
        cell.backgroundColor = UIColor.init(red: 0.223, green: 0.243, blue: 0.274, alpha: 1)
        
        return cell
    }
    
}
