//
//  SignupView.swift
//  wspr
//
//  Created by Pinto Junior, William James on 13/01/22.
//

import UIKit

class SignupView: UIView {
    @IBOutlet var viewBase: UIView!
    @IBOutlet weak var textFieldState: UITextField!
    @IBOutlet weak var textFieldCity: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder )
        commonInit()
    }
    
    private func commonInit() {
        Bundle(for: type(of: self)).loadNibNamed("SignupView", owner: self, options: nil)
        addSubview(viewBase)
        viewBase.frame = bounds
        viewBase.autoresizingMask = [.flexibleWidth, .flexibleHeight ]
    }
    
    @IBAction func buttonSelect(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let listVC = storyboard.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else{
            return
        }
        
        let listModel: [ItemModel] = [ItemModel(title: "State 1", color: .blue, type: .typeState),
                                    ItemModel(title: "State 2", color: .green, type: .typeState),
                                    ItemModel(title: "State 3", color: .gray, type: .typeState),
                                    ItemModel(title: "State 4", color: .red, type: .typeState),
                                    ItemModel(title: "State 5", color: .orange, type: .typeState)]
        listVC.listView = listModel
        
        listVC.delegate = self
//        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    @IBAction func buttonCitySelect(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let listVC = storyboard.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else{
            return
        }
        
        let listModel: [ItemModel] = [ItemModel(title: "City 1", color: .blue, type: .typeCity),
                                      ItemModel(title: "City 2", color: .green, type: .typeCity),
                                      ItemModel(title: "City 3", color: .gray, type: .typeCity),
                                      ItemModel(title: "City 4", color: .red, type: .typeCity),
                                      ItemModel(title: "City 5", color: .orange, type: .typeCity)]
        listVC.listView = listModel
        
        listVC.delegate = self
//        self.navigationController?.pushViewController(listVC, animated: true)
    }
}

extension SignupView: ListViewControllerDelegate {
    func updateItem(_ item: ItemModel) {
        switch item.type {
        case .typeState:
            textFieldState.text = item.title
            break
        case .typeCity:
            textFieldCity.text = item.title
            break
        }
    }
}
