//
//  AddTodoViewModel.swift
//  TodoList
//
//  Created by Yakup on 1.10.2023.
//

import Foundation
import RxSwift

class AddTodoViewModel{
	var dataRepo = TodoDaoRepository()
	
	func addTodo(todo: Todo){
		dataRepo.addTodo(todo: todo)
	}
}
