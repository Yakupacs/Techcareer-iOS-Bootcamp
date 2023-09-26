//
//  ContactDaoRepository.swift
//  ContactApp
//
//  Created by Yakup on 26.09.2023.
//

import Foundation
import RxSwift

// Dao: Database Access Object
class ContactDaoRepository{
	var contactList = BehaviorSubject<[Contact]>(value: [Contact]())
	
	func save(id: Int, name: String, surname: String, phone: String)
	{
		print("First Name: \(name), Phone Number: \(phone)")
	}
	
	func update(id: Int, name: String, surname: String, phone: String) {
		print("\(id)\n\(name)\n\(surname)")
	}
	
	func search(searchText: String){
		print("Contact Search: \(searchText)")
	}
	
	func delete(id: Int){
		print("Contact Delete: \(id)")
	}
	
	func contactUpload(){
		var contacts = [Contact]()
		contacts.append(Contact(id: 1, firstName: "Yakup", lastName: "Açış", phoneNumber: "05345353531"))
		contacts.append(Contact(id: 2, firstName: "Yakup", lastName: "Açış", phoneNumber: "05345353551"))
		contacts.append(Contact(id: 3, firstName: "Yakup", lastName: "Açış", phoneNumber: "05344444441"))
		contacts.append(Contact(id: 4, firstName: "Yakup", lastName: "Açış", phoneNumber: "05349898981"))
		contacts.append(Contact(id: 5, firstName: "Yakup", lastName: "Açış", phoneNumber: "05345787871"))
		contacts.append(Contact(id: 6, firstName: "Yakup", lastName: "Açış", phoneNumber: "05346767671"))
		contacts.append(Contact(id: 7, firstName: "Yakup", lastName: "Açış", phoneNumber: "05349493431"))
		contactList.onNext(contacts)
	}
}
