//
//  DetailVC.swift
//  TodoList
//
//  Created by Yakup on 29.09.2023.
//

import UIKit

class DetailVC: UIViewController {
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var todoTextField: UITextField!
	@IBOutlet weak var valueSwitch: UISwitch!
	
	var todo: Todo?
	var detailTodoViewModel = DetailTodoViewModel()
	let doneGif = UIImage.gifImageWithName("donegif")
	let doitnowGif = UIImage.gifImageWithName("doitnow")
	
	override func viewDidLoad() {
		super.viewDidLoad()
		appearance()
	}
	
	@IBAction func valueChanged(_ sender: Any) {
		if valueSwitch.isOn == true{
			todo?.done = 1
			imageView.image = doneGif
		}else{
			todo?.done = 0
			imageView.image = doitnowGif
		}
	}
	@IBAction func saveAction(_ sender: Any) {
		if todoTextField.text != ""{
			todo?.title = todoTextField.text!
			detailTodoViewModel.updateTodo(todo: todo!)
			navigationController?.popViewController(animated: true)
		}
	}

	func appearance(){
		if let todo = todo{
			if todo.done == 1{
				imageView.image = doneGif
				valueSwitch.isOn = true
			}else{
				imageView.image = doitnowGif
				valueSwitch.isOn = false
			}
			todoTextField.text = todo.title
		}
		
		self.navigationItem.title = "Detail"
		
		let appearance = UINavigationBarAppearance()
		appearance.titleTextAttributes = [.foregroundColor: UIColor.black,
										  .font: (UIFont(name: "Arial", size: 18))!]
		
		navigationController?.navigationBar.standardAppearance = appearance
		navigationController?.navigationBar.compactAppearance = appearance
		navigationController?.navigationBar.scrollEdgeAppearance = appearance
	}
	
}
