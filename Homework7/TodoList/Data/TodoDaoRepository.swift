//
//  DataRepository.swift
//  TodoList
//
//  Created by Yakup on 29.09.2023.
//

import Foundation
import RxSwift

class TodoDaoRepository{
	var todos = BehaviorSubject<[Todo]>(value: [])
	let db: FMDatabase?
	
	init(){
		let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
		let databaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("todo.sqlite")
		db = FMDatabase(path: databaseURL.path)
	}
	
	func addTodo(todo: Todo){
		db?.open()
		
		do {
			try db!.executeUpdate("INSERT INTO todo_table (title, done) VALUES (?,?)", values: [todo.title, todo.done])
		} catch{
			print(error.localizedDescription)
		}
		
		db?.close()
	}
	
	func updateTodo(todo: Todo){
		db?.open()
		
		do {
			try db!.executeUpdate("UPDATE todo_table SET title=?,done=? WHERE id=?", values: [todo.title, todo.done, todo.id!])
		} catch{
			print(error.localizedDescription)
		}
	}
	
	func deleteTodo(todo: Todo){
		db?.open()
		
		do {
			try db!.executeUpdate("DELETE FROM todo_table WHERE id=?", values: [todo.id!])
		} catch{
			print(error.localizedDescription)
		}
	}
	
	func searchTodo(title: String){
		db?.open()
		
		var searchTodos = [Todo]()
		
		do {
			let rs = try db!.executeQuery("SELECT * FROM todo_table WHERE title like '%\(title)%'", values: nil)
			while rs.next(){
				let todo_id = Int(rs.string(forColumn: "id")!)!
				let todo_title = rs.string(forColumn: "title")!
				let todo_done = Int(rs.string(forColumn: "done")!)!
				
				let todo = Todo(id: todo_id, title: todo_title, done: todo_done)
				
				searchTodos.append(todo)
			}
			todos.onNext(searchTodos)

		} catch{
			print(error.localizedDescription)
		}

		db?.close()
	}
	
	func getAllTodo(){
		db?.open()
		
		var tds = [Todo]()
		
		do {
			let rs = try db!.executeQuery("SELECT * FROM todo_table", values: nil)
			print(rs)
			while rs.next(){
				let todo_id = Int(rs.string(forColumn: "id")!)!
				let todo_title = rs.string(forColumn: "title")!
				let todo_done = Int(rs.string(forColumn: "done")!)!
				
				let todo = Todo(id: todo_id, title: todo_title, done: todo_done)
				
				tds.append(todo)
			}
			todos.onNext(tds)
		} catch{
			print(error.localizedDescription)
		}
		
		db?.close()
	}
	
	func databaseCopy(){
		let bundlePath = Bundle.main.path(forResource: "todo", ofType: ".sqlite")
		let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
		let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("todo.sqlite")
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
