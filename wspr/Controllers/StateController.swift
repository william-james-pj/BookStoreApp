//
//  StateController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 11/01/22.
//

import UIKit

protocol StateControllerDelegate {
    func updateState(_ state: String)
}

class StateController: UIViewController {
    
    var delegate: StateControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func returnState(_ sender: UIButton) {
        setState(sender.currentTitle!)
    }
    
    fileprivate func setState(_ selectedState: String) {
        guard let delegate = delegate else {
            return
        }
        navigationController?.popViewController(animated: true)
        delegate.updateState(selectedState)
    }

}
