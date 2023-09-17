//
//  ViewController.swift
//  WorkingStructure
//
//  Created by Yakup on 14.09.2023.
//

import UIKit

class HomepageVC: UIViewController {

    @IBOutlet weak var homepageLabel: UILabel!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapClick(_ sender: Any) {
        count += 1
        homepageLabel.text = String(count)
        if (count == 5)
        {
            performSegue(withIdentifier: "toGameScreen", sender: nil)
        }
    }
    
    @IBAction func startFunc(_ sender: Any) {
        performSegue(withIdentifier: "toGameScreen", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}

