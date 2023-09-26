//
//  HomepageViewModel.swift
//  MVVMExercise
//
//  Created by Yakup on 26.09.2023.
//

import Foundation
import RxSwift

class HomepageViewModel{
	var result = BehaviorSubject<String>(value: "Result: 0")
	var mrepo = MathRepository()

	init(){
		result = mrepo.result
	}
	
	func addition(getNum1: String, getNum2: String){
		mrepo.addition(getNum1: getNum1, getNum2: getNum2)
	}

	func multiplication(getNum1: String, getNum2: String){
		mrepo.multiplication(getNum1: getNum1, getNum2: getNum2)
	}

}
