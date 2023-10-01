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
	let db:FMDatabase?
	
	init(){
		let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
		let databaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("contact.sqlite")
		db = FMDatabase(path: databaseURL.path)
	}
	
	func save(id: Int, name: String, surname: String, phone: String)
	{
		db?.open()
	
		do {
			try db!.executeUpdate("INSERT INTO contact (person_name, person_surname, person_tel) VALUES (?,?,?)", values: [name, surname, phone])
		} catch{
			print(error.localizedDescription)
		}
		
		db?.close()
	}
	
	func update(id: Int, name: String, surname: String, phone: String) {
		db?.open()
	
		do {
			try db!.executeUpdate("UPDATE contact SET person_name=?,person_surname=?,person_tel=? WHERE person_id=?", values: [name, surname, phone, id])
		} catch{
			print(error.localizedDescription)
		}
		
		db?.close()
	}
	
	func search(searchText: String){
		db?.open()
		
		var contacts = [Contact]()
		
		do {
			let rs = try db!.executeQuery("SELECT * FROM contact WHERE person_name like '%\(searchText)%'", values: nil)
			while rs.next(){
				let person_id = Int(rs.string(forColumn: "person_id")!)!
				let person_name = rs.string(forColumn: "person_name")!
				let person_surname = rs.string(forColumn: "person_surname")!
				let person_tel = rs.string(forColumn: "person_tel")!
				
				let person = Contact(id: person_id, firstName: person_name, lastName: person_surname, phoneNumber: person_tel)
				
				contacts.append(person)
			}
			contactList.onNext(contacts)

		} catch{
			print(error.localizedDescription)
		}

		db?.close()
	}
	
	func delete(id: Int){
		db?.open()
	
		do {
			try db!.executeUpdate("DELETE FROM contact WHERE person_id=?", values: [id])
		} catch{
			print(error.localizedDescription)
		}
		
		db?.close()
	}
	
	func contactUpload(){
		db?.open()
		
		var contacts = [Contact]()
		
		do {
			let rs = try db!.executeQuery("SELECT * FROM contact", values: nil)
			while rs.next(){
				let person_id = Int(rs.string(forColumn: "person_id")!)!
				let person_name = rs.string(forColumn: "person_name")!
				let person_surname = rs.string(forColumn: "person_surname")!
				let person_tel = rs.string(forColumn: "person_tel")!
				
				let person = Contact(id: person_id, firstName: person_name, lastName: person_surname, phoneNumber: person_tel)
				
				contacts.append(person)
			}
			contactList.onNext(contacts)

		} catch{
			print(error.localizedDescription)
		}

		db?.close()
	}
	
	func databaseCopy(){
		let bundlePath = Bundle.main.path(forResource: "contact", ofType: ".sqlite")
		let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
		let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("contact.sqlite")
		let fileManager = FileManager.default
		if fileManager.fileExists(atPath: copyPath.path){
			print("Already exist database!")
		}else{
			do {
				try fileManager.copyItem(atPath: bundlePath!, toPath: copyPath.path)
			} catch {}
		}
	}
}
