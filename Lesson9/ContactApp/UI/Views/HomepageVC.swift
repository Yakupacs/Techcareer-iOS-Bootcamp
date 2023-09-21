//
//  ViewController.swift
//  ContactApp
//
//  Created by Yakup on 21.09.2023.
//

import UIKit

class HomepageVC: UIViewController {
	
	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var tableView: UITableView!
	
	var contacts: [Contact] = [
		Contact(id: 1, firstName: "Yakup", lastName: "Açış", phoneNumber: "05345353531"),
		Contact(id: 2, firstName: "Tunahan", lastName: "Demirkol", phoneNumber: "0535353532"),
		Contact(id: 3, firstName: "Furkan", lastName: "Bingöl", phoneNumber: "0535353533"),
		Contact(id: 4, firstName: "Elanur", lastName: "Kurt", phoneNumber: "0535353534"),
		Contact(id: 5, firstName: "Sümeyye", lastName: "Büyükgüçlü", phoneNumber: "0535353535"),
		Contact(id: 6, firstName: "Buse", lastName: "Keklik", phoneNumber: "0535353536"),
		Contact(id: 7, firstName: "Nedime Serra", lastName: "Liman", phoneNumber: "0535353537"),
		Contact(id: 8, firstName: "Muhammed Ali", lastName: "Açış", phoneNumber: "0535353538"),
		Contact(id: 9, firstName: "Arif", lastName: "Ünlüer", phoneNumber: "0535353539"),
		Contact(id: 10, firstName: "Emirhan", lastName: "Kurul", phoneNumber: "0535353511"),
		Contact(id: 11, firstName: "Semih", lastName: "Kalay", phoneNumber: "0535353512")]
	var selectedContact: Contact?
	var filteredContact: [Contact] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		searchBar.delegate = self
		tableView.delegate = self
		tableView.dataSource = self
		
		filteredContact = contacts
	}
	
	override func viewWillAppear(_ animated: Bool) {
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "contactDetail" {
			let vc = segue.destination as! ContactDetail
			vc.contact = selectedContact
		}
	}
}

// MARK: - UITableView
extension HomepageVC: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filteredContact.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ContactCellTableViewCell {
			cell.nameSurnameLabel.text = "\(filteredContact[indexPath.row].firstName!) \(filteredContact[indexPath.row].lastName!)"
			cell.phoneNumberLabel.text = filteredContact[indexPath.row].phoneNumber
			return cell
		}
		return UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		selectedContact = filteredContact[indexPath.row]
		performSegue(withIdentifier: "contactDetail", sender: nil)
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
			
			let alert = UIAlertController(title: "Warning!", message: "Are you sure to delete the user?", preferredStyle: .alert)
			let okButton = UIAlertAction(title: "Delete", style: .destructive) { _ in
				self.filteredContact.remove(at: indexPath.row)
				self.contacts.remove(at: indexPath.row)
				tableView.reloadData()
			}
			let noButton = UIAlertAction(title: "Cancel", style: .cancel)
			alert.addAction(noButton)
			alert.addAction(okButton)
			self.present(alert, animated: true)
		}
		let addAction = UIContextualAction(style: .normal, title: "Details") { contextualAction, view, bool in
			self.selectedContact = self.filteredContact[indexPath.row]
			self.performSegue(withIdentifier: "contactDetail", sender: nil)
			tableView.reloadData()
		}
		return UISwipeActionsConfiguration(actions: [deleteAction,addAction])
	}
}

// MARK: - UISearchBarDelegate
extension HomepageVC: UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		filteredContact = []
		
		if searchText == "" {
			filteredContact = contacts
		}

		for contact in contacts{
			if contact.firstName!.uppercased().contains(searchText.uppercased()) {
				filteredContact.append(contact)
			}
		}
		
		tableView.reloadData()
	}
}
