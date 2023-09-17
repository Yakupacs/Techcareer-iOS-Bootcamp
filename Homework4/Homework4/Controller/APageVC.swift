//
//  APageVC.swift
//  Homework4
//
//  Created by Yakup on 18.09.2023.
//

import UIKit

class APageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

	@IBAction func bFunc(_ sender: Any) {
		performSegue(withIdentifier: "toB", sender: nil)
	}
}
