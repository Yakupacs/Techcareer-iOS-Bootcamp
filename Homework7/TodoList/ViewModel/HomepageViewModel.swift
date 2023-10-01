//
//  TodoViewModel.swift
//  TodoList
//
//  Created by Yakup on 29.09.2023.
//

import Foundation
import RxSwift

class HomepageViewModel{
	var todos = BehaviorSubject<[Todo]>(value: [Todo]())
	var dataRepo = TodoDaoRepository()
	
	init(){
		dataRepo.databaseCopy()
		todos = dataRepo.todos
	}
	
	func deleteTodo(todo: Todo){
		dataRepo.deleteTodo(todo: todo)
		getAllTodo()
	}
	
	func searchTodo(title: String){
		dataRepo.searchTodo(title: title)
	}
	
	func getAllTodo(){
		dataRepo.getAllTodo()
	}
}
