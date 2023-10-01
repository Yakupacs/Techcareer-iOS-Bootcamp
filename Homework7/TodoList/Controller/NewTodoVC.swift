//
//  NewTodoVC.swift
//  TodoList
//
//  Created by Yakup on 30.09.2023.
//

import UIKit

class NewTodoVC: UIViewController {

	@IBOutlet weak var gifImageView: UIImageView!
	@IBOutlet weak var todoTextField: UITextField!
	
	var addTodoViewModel = AddTodoViewModel()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		appearance()
    }

	@IBAction func addAction(_ sender: Any) {
		if todoTextField.text?.count != 0 {
			addTodoViewModel.addTodo(todo: Todo( title: todoTextField.text!, done: 0))
			navigationController?.popViewController(animated: true)
		}
		else{
			print("Error")
		}
	}
	
	func appearance(){
		let gif = UIImage.gifImageWithName("letsdothis")
		gifImageView.image = gif

		self.navigationItem.title = "New Todo"
		
		let appearance = UINavigationBarAppearance()
		appearance.titleTextAttributes = [.foregroundColor: UIColor.black,
										  .font: (UIFont(name: "Arial", size: 18))!]
		
		navigationController?.navigationBar.standardAppearance = appearance
		navigationController?.navigationBar.compactAppearance = appearance
		navigationController?.navigationBar.scrollEdgeAppearance = appearance
	}
}
