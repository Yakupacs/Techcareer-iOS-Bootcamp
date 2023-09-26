//
//  MathRepository.swift
//  MVVMExercise
//
//  Created by Yakup on 26.09.2023.
//

import Foundation
import RxSwift

class MathRepository {
	var result = BehaviorSubject<String>(value: "Result: 0")
	
	func addition(getNum1: String, getNum2: String){
		if let number1 = Int(getNum1), let number2 = Int(getNum2) {
			let sum = number1 + number2
			result.onNext("Result: \(sum)") // Trigger
		}
	}
	
	func multiplication(getNum1: String, getNum2: String){
		if let number1 = Int(getNum1), let number2 = Int(getNum2) {
			let mul = number1 * number2
			result.onNext("Result: \(mul)") // Trigger
		}
	}
}
