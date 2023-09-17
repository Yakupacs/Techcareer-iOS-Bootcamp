//
//  XPageVC.swift
//  Homework4
//
//  Created by Yakup on 18.09.2023.
//

import UIKit

class XPageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	@IBAction func yFunc(_ sender: Any) {
		performSegue(withIdentifier: "toY", sender: nil)
	}
	
}
