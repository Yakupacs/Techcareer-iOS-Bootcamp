//
//  ViewController.swift
//  Lesson7
//
//  Created by Yakup on 19.09.2023.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var label1: UILabel!
	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var button1: UIButton!
	@IBOutlet weak var button2: UIButton!
	@IBOutlet weak var `switch`: UISwitch!
	@IBOutlet weak var segmentControl: UISegmentedControl!
	@IBOutlet weak var label2: UILabel!
	@IBOutlet weak var label3: UILabel!
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var label4: UILabel!
	@IBOutlet weak var stepper: UIStepper!
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
//		activityIndicator.hidesWhenStopped = true
		
	}

	// MARK: - Segment Control Value Changed
	@IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
		let selectedIndex = sender.selectedSegmentIndex
		let selectedCategory = sender.titleForSegment(at: selectedIndex)
		label3.text = "Selected Category: \(String(describing: selectedCategory!))"
	}
	
	// MARK: - Switch Value Changed
	@IBAction func switchValueChanged(_ sender: UISwitch) {
		let selectedIndex = sender.isOn
		label2.text = "Selected Switch: \(selectedIndex)"
	}
	
	// MARK: - Slider Value Changed
	@IBAction func sliderValueChanged(_ sender: UISlider) {
		let selectedIndex = Int(sender.value)
		label4.text = "Selected Slider: \(selectedIndex)"
	}
	
	// MARK: - Stepper Value Changed
	@IBAction func stepperValueChanged(_ sender: UIStepper) {
		let selectedIndex = sender.value
		label1.text = "Selected Stepper: \(selectedIndex)"
	}
	
	@IBAction func startAction(_ sender: Any) {
		activityIndicator.startAnimating()
	}
	
	@IBAction func stopAction(_ sender: Any) {
		activityIndicator.stopAnimating()
	}
}

