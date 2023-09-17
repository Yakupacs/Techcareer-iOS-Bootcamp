//
//  GameVC.swift
//  WorkingStructure
//
//  Created by Yakup on 14.09.2023.
//

import UIKit

class GameVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var message : String?
    var getPerson: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let getPerson = getPerson{
            titleLabel.text = "\(getPerson.name!), \(getPerson.age!), \(getPerson.height!), \(getPerson.unmarried!)"
        }
    }
    
    @IBAction func backFunc(_ sender: Any) {
        //navigationController?.popViewController(animated: true)
        navigationController?.popToRootViewController(animated: true) // Go to the root view controller
    }
    
    @IBAction func nextFunc(_ sender: Any) {
        performSegue(withIdentifier: "toResultScreen", sender: nil)
    }
}
 
