//
//  ContactDetail.swift
//  ContactApp
//
//  Created by Yakup on 21.09.2023.
//

import UIKit

class ContactDetail: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var firstNameTxtfield: UITextField!
	@IBOutlet weak var lastNameTxtfield: UITextField!
	@IBOutlet weak var phoneNumberTxtfield: UITextField!
	@IBOutlet weak var updateButton: UIBarButtonItem!
	
	var contact: Contact?
	
	var viewModel = ContactDetailViewModel()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		firstNameTxtfield.delegate = self
		lastNameTxtfield.delegate = self
		phoneNumberTxtfield.delegate = self
		
		if let contact = contact {
			firstNameTxtfield.text = contact.firstName
			lastNameTxtfield.text = contact.lastName
			phoneNumberTxtfield.text = contact.phoneNumber
		}
		
		updateButton.isEnabled = false
    }
	
	@IBAction func updateAction(_ sender: Any) {
		viewModel.update(kisi_id: Int(phoneNumberTxtfield.text!)!, kisi_ad: firstNameTxtfield.text!, kisi_tel: phoneNumberTxtfield.text!)
	}
	
	func textFieldDidChangeSelection(_ textField: UITextField) {
		if firstNameTxtfield.text != "" && lastNameTxtfield.text != "" && phoneNumberTxtfield.text != "" {
			updateButton.isEnabled = true
		}
		else {
			updateButton.isEnabled = false
		}
	}
}
