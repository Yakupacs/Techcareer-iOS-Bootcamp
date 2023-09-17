//
//  ViewController.swift
//  Homework4
//
//  Created by Yakup on 17.09.2023.
//

import UIKit

class HomepageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
	}

	@IBAction func aFunc(_ sender: Any) {
		performSegue(withIdentifier: "toA", sender: nil)
	}
	
	@IBAction func xFunc(_ sender: Any) {
		performSegue(withIdentifier: "toX", sender: nil)
	}
	
}

