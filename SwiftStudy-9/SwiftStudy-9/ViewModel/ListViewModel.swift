//
//  ListViewModel.swift
//  SwiftStudy-9
//
//  Created by 윤강록 on 2/6/24.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var todos: [Todo] = []
    
    init() {
        getTodos()
    }
    
    func getTodos() {
        let newTodos = [
            Todo(doing: "Make lunch",done: false),
            Todo(doing: "Feed the cat",done: false),
            Todo(doing: "Watch WWDC",done: false)
        ]
        todos.append(contentsOf: newTodos)
    }
    
    func addTodo(doing: String) {
        let newTodos = Todo(doing: doing, done: false)
        todos.append(newTodos)
    }
}
