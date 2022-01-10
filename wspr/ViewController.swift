//
//  ViewController.swift
//  wspr
//
//  Created by Pinto Junior, William James on 06/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageViewChange: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonChangerImage(_ sender: UIButton) {
        let images = [ #imageLiteral(resourceName: "dexter"), #imageLiteral(resourceName: "Nick_Netflix_vertical"), #imageLiteral(resourceName: "mi"), #imageLiteral(resourceName: "panda"), #imageLiteral(resourceName: "macaco")]
        imageViewChange.image = images.randomElement()
    }
    

}

