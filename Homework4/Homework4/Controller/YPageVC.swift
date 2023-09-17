//
//  YPageVC.swift
//  Homework4
//
//  Created by Yakup on 18.09.2023.
//

import UIKit

class YPageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	@IBAction func returnFunc(_ sender: Any) {
		performSegue(withIdentifier: "toHome", sender: nil)
	}
}
