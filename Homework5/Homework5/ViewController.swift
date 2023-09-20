//
//  ViewController.swift
//  Homework5
//
//  Created by Yakup on 20.09.2023.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var view1: UIView!
	@IBOutlet weak var view2: UIView!
	@IBOutlet weak var resultLabel: UILabel!
	@IBOutlet weak var infoLabel: UILabel!
	@IBOutlet weak var acButton: UIButton!
	@IBOutlet weak var plusButton: UIButton!
	@IBOutlet weak var equalButton: UIButton!
	@IBOutlet weak var sevenButton: UIButton!
	@IBOutlet weak var eightButton: UIButton!
	@IBOutlet weak var nineButton: UIButton!
	@IBOutlet weak var fourButton: UIButton!
	@IBOutlet weak var fiveButton: UIButton!
	@IBOutlet weak var sixButton: UIButton!
	@IBOutlet weak var oneButton: UIButton!
	@IBOutlet weak var twoButton: UIButton!
	@IBOutlet weak var threeButton: UIButton!
	@IBOutlet weak var zeroButton: UIButton!
	@IBOutlet weak var commaButton: UIButton!
	
	var process = String()
	var number = String()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		cornerRadiusViews()
	}
	
	// MARK: - İşlemin sonuna ekle
	func addProcess(_ number: Float) {
		if process.isEmpty == true {
			process.append("\(number)")
		}
		else
		{
			process.append("+\(number)")
		}
		infoLabel.text = process
	}
	
	// MARK: - Temizleme
	@IBAction func acAction(_ sender: Any) {
		resultLabel.text = "0"
		infoLabel.text = "0"
		process = ""
		number = ""
	}
	
	// MARK: - Virgül
	@IBAction func commaAction(_ sender: Any) {
		number.append(".")
		resultLabel.text = number
	}
	
	// MARK: - Artı, Toplama
	@IBAction func plusAction(_ sender: Any) {
		if number != "" {
			addProcess(Float(number)!)
			number = ""
			resultLabel.text = "0"
		}
	}
	
	// MARK: - Toplama
	@IBAction func equalAction(_ sender: Any) {
		let subStr = process.split(separator: "+")
		var total : Float = 0.0
		
		for number in subStr {
			total += (Float(number))!
		}
		resultLabel.text = String(total)
		infoLabel.text = "\(process)=\(total)"
	}
	
	// MARK: - 0
	@IBAction func action0(_ sender: Any) {
		number.append("0")
		resultLabel.text = number
	}
	
	// MARK: - 1
	@IBAction func action1(_ sender: Any) {
		number.append("1")
		resultLabel.text = number
	}
	
	// MARK: - 2
	@IBAction func action2(_ sender: Any) {
		number.append("2")
		resultLabel.text = number
	}
	
	// MARK: - 3
	@IBAction func action3(_ sender: Any) {
		number.append("3")
		resultLabel.text = number
	}
	
	// MARK: - 4
	@IBAction func action4(_ sender: Any) {
		number.append("4")
		resultLabel.text = number
	}
	
	// MARK: - 5
	@IBAction func action5(_ sender: Any) {
		number.append("5")
		resultLabel.text = number
	}
	
	// MARK: - 6
	@IBAction func action6(_ sender: Any) {
		number.append("6")
		resultLabel.text = number
	}
	
	// MARK: - 7
	@IBAction func action7(_ sender: Any) {
		number.append("7")
		resultLabel.text = number
	}
	
	// MARK: - 8
	@IBAction func action8(_ sender: Any) {
		number.append("8")
		resultLabel.text = number
	}
	
	// MARK: - 9
	@IBAction func action9(_ sender: Any) {
		number.append("9")
		resultLabel.text = number
	}
	
	// MARK: - Görünüm ayarları
	func cornerRadiusViews() {
		view1.layer.cornerRadius = 40
		view2.layer.cornerRadius = 40
		acButton.layer.cornerRadius = 10
		plusButton.layer.cornerRadius = 10
		equalButton.layer.cornerRadius = 10
		sevenButton.layer.cornerRadius = 10
		eightButton.layer.cornerRadius = 10
		nineButton.layer.cornerRadius = 10
		fourButton.layer.cornerRadius = 10
		fiveButton.layer.cornerRadius = 10
		acButton.layer.cornerRadius = 10
		sixButton.layer.cornerRadius = 10
		oneButton.layer.cornerRadius = 10
		twoButton.layer.cornerRadius = 10
		threeButton.layer.cornerRadius = 10
		zeroButton.layer.cornerRadius = 10
		commaButton.layer.cornerRadius = 10
	}
}
