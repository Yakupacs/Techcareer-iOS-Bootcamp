//
//  ViewController.swift
//  Date&TimePicker
//
//  Created by Yakup on 21.09.2023.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var textfieldTime: UITextField!
	@IBOutlet weak var textfieldDate: UITextField!
	
	var timePicker: UIDatePicker?
	var datePicker: UIDatePicker?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		timePicker = UIDatePicker()
		timePicker?.datePickerMode = .time
		textfieldTime.inputView = timePicker
		
		datePicker = UIDatePicker()
		datePicker?.datePickerMode = .date
		textfieldDate.inputView = datePicker
		
		if #available(iOS 13.4, *) {
			timePicker?.preferredDatePickerStyle = .wheels
			datePicker?.preferredDatePickerStyle = .wheels
		}
		
		let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scannerGestureRecognizer))
		view.addGestureRecognizer(gestureRecognizer)
		
		timePicker?.addTarget(self, action: #selector(showTime(datePicker:)), for: .valueChanged)
		
		datePicker?.addTarget(self, action: #selector(showDate(datePicker:)), for: .valueChanged)
	}

	@objc func scannerGestureRecognizer() {
		print("The Screen clicked!")
		view.endEditing(true)
	}
	
	@objc func showTime(datePicker: UIDatePicker) {
		let format = DateFormatter()
		format.dateFormat = "HH:mm"
		let getTime = format.string(from: datePicker.date)
		textfieldTime.text = getTime
	}
	
	@objc func showDate(datePicker: UIDatePicker) {
		let format = DateFormatter()
		format.dateFormat = "MM/dd/yyyy"
		let getTime = format.string(from: datePicker.date)
		textfieldDate.text = getTime
	}
}

