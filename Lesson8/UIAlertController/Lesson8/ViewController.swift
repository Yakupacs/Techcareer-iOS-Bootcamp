//
//  ViewController.swift
//  Lesson8
//
//  Created by Yakup on 20.09.2023.
//

import UIKit

class ViewController: UIViewController {

	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func alertAction(_ sender: Any) {
		let alert = UIAlertController(title: "Warning!", message: "Username or password is incorrect!", preferredStyle: .alert)
		
		let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
			print("Cancel Action Clicked!")
		}
		let okAction = UIAlertAction(title: "Okey", style: .default) { _ in
			print("Okey Action Clicked!")
		}
		
		alert.addAction(cancelAction)
		alert.addAction(okAction)
		
		self.present(alert, animated: true)
	}
	
	@IBAction func actionSheetAction(_ sender: Any) {
		let alert = UIAlertController(title: "Warning!", message: "Username or password is incorrect!", preferredStyle: .actionSheet)
		
		let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
			print("Cancel Action Clicked!")
		}
		let okAction = UIAlertAction(title: "Okey", style: .default) { _ in
			print("Okey Action Clicked!")
		}
		
		alert.addAction(cancelAction)
		alert.addAction(okAction)
		
		self.present(alert, animated: true)
	}
	
	@IBAction func speacialAlertAction(_ sender: Any) {
		let alert = UIAlertController(title: "System Login", message: "Email and Password required!", preferredStyle: .alert)
		
		alert.addTextField() { textField in // Index: 0
			textField.placeholder = "Email"
			textField.keyboardType = .emailAddress
		}
		
		alert.addTextField() { textField in // Index: 1
			textField.placeholder = "Password"
			textField.keyboardType = .numberPad
			textField.isSecureTextEntry = true
		}
		
		let loginAction = UIAlertAction(title: "Login", style: .cancel){ _ in
			let txtFieldEmail = alert.textFields![0] as UITextField
			let txtFieldPassword = alert.textFields![1] as UITextField
			
			if let email = txtFieldEmail.text, let password = txtFieldPassword.text {
				print("Email: \(email), Password: \(password)")
			}
		}
		
		alert.addAction(loginAction)
		
		self.present(alert, animated: true)
	}
	
}

