//
//  GameVC.swift
//  WorkingStructure
//
//  Created by Yakup on 14.09.2023.
//

import UIKit

class GameVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Merhaba"
    }
    
    @IBAction func backFunc(_ sender: Any) {
        //navigationController?.popViewController(animated: true)
        navigationController?.popToRootViewController(animated: true) // Go to the root view controller
    }
    
    @IBAction func nextFunc(_ sender: Any) {
        performSegue(withIdentifier: "toResultScreen", sender: nil)
    }
}
 
