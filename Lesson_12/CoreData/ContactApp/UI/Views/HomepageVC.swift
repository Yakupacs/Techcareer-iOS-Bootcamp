//
//  ViewController.swift
//  ContactApp
//
//  Created by Yakup on 21.09.2023.
//

import UIKit
import RxSwift

class HomepageVC: UIViewController {
	
	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var tableView: UITableView!
	
	var contacts: [ContactModel] = []
	var selectedContact: ContactModel?
	
	var viewModel = HomepageViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		searchBar.delegate = self
		tableView.delegate = self
		tableView.dataSource = self
		
		_ = viewModel.contactList.subscribe(onNext: { liste in
			self.contacts = liste
			self.tableView.reloadData()
		})
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		viewModel.contactUpload()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "contactDetail" {
			if let contact = sender as? ContactModel{
				let vc = segue.destination as! ContactDetail
				vc.contact = contact
			}
		}
	}
}

// MARK: - UITableView
extension HomepageVC: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return contacts.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ContactCellTableViewCell {
			cell.nameSurnameLabel.text = "\(contacts[indexPath.row].person_name!) \(contacts[indexPath.row].person_surname!)"
			cell.phoneNumberLabel.text = contacts[indexPath.row].person_tel
			return cell
		}
		return UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		selectedContact = contacts[indexPath.row]
		performSegue(withIdentifier: "contactDetail", sender: nil)
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
			
			let alert = UIAlertController(title: "Warning!", message: "Are you sure to delete the user?", preferredStyle: .alert)
			let okButton = UIAlertAction(title: "Delete", style: .destructive) { _ in
				self.viewModel.delete(contact: self.contacts[indexPath.row])

			}
			let noButton = UIAlertAction(title: "Cancel", style: .cancel)
			alert.addAction(noButton)
			alert.addAction(okButton)
			self.present(alert, animated: true)
		}
		let addAction = UIContextualAction(style: .normal, title: "Details") { contextualAction, view, bool in
			self.selectedContact = self.contacts[indexPath.row]
			self.performSegue(withIdentifier: "contactDetail", sender: nil)
			tableView.reloadData()
		}
		return UISwipeActionsConfiguration(actions: [deleteAction,addAction])
	}
}

// MARK: - UISearchBarDelegate
extension HomepageVC: UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		if searchText == ""{
			viewModel.contactUpload()
		}else{
			viewModel.search(searchText: searchText)
		}
	}
}
