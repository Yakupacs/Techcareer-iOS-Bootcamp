//
//  ContactRegisterVC.swift
//  ContactApp
//
//  Created by Yakup on 21.09.2023.
//

import UIKit

class ContactRegisterVC: UIViewController, UITextFieldDelegate {

	
	@IBOutlet weak var saveButton: UIBarButtonItem!
	@IBOutlet weak var firstNameTxtfield: UITextField!
	@IBOutlet weak var lastNameTxtfield: UITextField!
	@IBOutlet weak var phoneNumberTxtfield: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		firstNameTxtfield.delegate = self
		lastNameTxtfield.delegate = self
		phoneNumberTxtfield.delegate = self
		
		saveButton.isEnabled = false
    }

	@IBAction func saveAction(_ sender: Any) {
		print("First Name: \(firstNameTxtfield.text!)\nLast Name: \(lastNameTxtfield.text!)\nPhone Number: \(phoneNumberTxtfield.text!)")
	}
	
	func textFieldDidChangeSelection(_ textField: UITextField) {
		if firstNameTxtfield.text != "" && lastNameTxtfield.text != "" && phoneNumberTxtfield.text != "" {
			saveButton.isEnabled = true
		}
		else{
			saveButton.isEnabled = false
		}
	}
}
