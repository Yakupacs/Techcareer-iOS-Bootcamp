//
//  ViewController.swift
//  UserDefaultsExercise
//
//  Created by Yakup on 1.10.2023.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var counterLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let ud = UserDefaults.standard
		
		ud.set("Yakup", forKey: "name")
		ud.set(1.78, forKey: "height")
		
		ud.removeObject(forKey: "name")
		
		let getName = ud.string(forKey: "name") ?? "Default"
		let getHeight = ud.double(forKey: "height")
		print("Get Name: \(getName)")
		print("Get Height: \(getHeight)")
		
		
		var counter = ud.integer(forKey: "counter")
		counter = counter + 1
		ud.set(counter, forKey: "counter")
		counterLabel.text = "\(counter)"
	}


}

