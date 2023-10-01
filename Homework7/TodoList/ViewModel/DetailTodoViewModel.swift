//
//  DetailTodoViewModel.swift
//  TodoList
//
//  Created by Yakup on 1.10.2023.
//

import Foundation
import RxSwift

class DetailTodoViewModel{
	var dataRepo = TodoDaoRepository()
	
	func updateTodo(todo: Todo){
		dataRepo.updateTodo(todo: todo)
	}
}
