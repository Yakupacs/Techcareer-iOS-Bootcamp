//
//  ViewController.swift
//  MVVMExercise
//
//  Created by Yakup on 26.09.2023.
//

import UIKit
import RxSwift

class HomepageVC: UIViewController {

	@IBOutlet weak var tfNum1: UITextField!
	@IBOutlet weak var tfNum2: UITextField!
	@IBOutlet weak var resultLabel: UILabel!
	
	var viewModel = HomepageViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		_ = viewModel.result.subscribe(onNext: { result in
			self.resultLabel.text = result
		})
	}
}

// MARK: - Actions
extension HomepageVC{
	@IBAction func additionAction(_ sender: Any) {
		if let getNum1 = tfNum1.text, let getNum2 = tfNum2.text {
			viewModel.addition(getNum1: getNum1, getNum2: getNum2)
		}
	}
	
	@IBAction func subtractionAction(_ sender: Any) {
		if let getNum1 = tfNum1.text, let getNum2 = tfNum2.text {
			viewModel.multiplication(getNum1: getNum1, getNum2: getNum2)
		}
	}
}
