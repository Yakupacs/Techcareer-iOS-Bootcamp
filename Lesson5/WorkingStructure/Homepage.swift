//
//  ViewController.swift
//  WorkingStructure
//
//  Created by Yakup on 14.09.2023.
//

import UIKit

class Homepage: UIViewController {

    @IBOutlet weak var homepageLabel: UILabel!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapClick(_ sender: Any) {
        count += 1
        homepageLabel.text = String(count)
    }
    
}

