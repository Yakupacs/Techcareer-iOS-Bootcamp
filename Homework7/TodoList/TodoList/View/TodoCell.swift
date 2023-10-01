//
//  TodoCell.swift
//  TodoList
//
//  Created by Yakup on 29.09.2023.
//

import UIKit

protocol ClickDone{
	func clickedDone(indexPath: IndexPath)
}

class TodoCell: UITableViewCell {
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var todoImageView: UIImageView!
	@IBOutlet weak var okButton: UIButton!
	
	var clickDone: ClickDone?
	var indexPath: IndexPath?
	
	func setup(indexPath: IndexPath, todos: [Todo]){
		let todo = todos[indexPath.row]
		titleLabel.text = todo.title
		if (todo.done == 1){
			self.todoImageView.image = UIImage(named: "welldone")
			self.okButton.setTitle("Not done", for: .normal)
		}
		else{
			self.todoImageView.image = UIImage(named: "todo")
			self.okButton.setTitle("Done", for: .normal)
			
		}
	}
	
	@IBAction func okAction(_ sender: Any) {
		clickDone?.clickedDone(indexPath: indexPath!)
	}
}
