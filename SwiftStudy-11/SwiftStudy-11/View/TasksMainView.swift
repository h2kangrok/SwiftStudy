//
//  TasksMainView.swift
//  SwiftStudy-11
//
//  Created by 윤강록 on 2/29/24.
//

import SwiftUI

struct TasksMainView: View {
    
    @State private var tasks: [TasksModel] = []
    @State private var Edit: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach($tasks) { task in
                    if Edit {
                        EditTasksView(task: task)
                    } else {
                        TasksView(tasks: task)
                    }
                }
                .onDelete(perform: deleteTask)
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    if Edit {
                        Button ("Done"){
                            Edit.toggle()
                        }
                    } else {
                        HStack {
                            Button {
                                addTasks()
                            } label: {
                                Image(systemName: "plus")
                            }
                            Button("Edit") {
                                Edit.toggle()
                            }
                        }
                    }
                }
            }
        }
    }
    func addTasks() {
        
        let newTask = TasksModel(task: "New Task", date: Date(), status: "Not Started")
        tasks.append(newTask)
        print(tasks)
    }
    private func deleteTask(at offsets: IndexSet) {
         tasks.remove(atOffsets: offsets)
     }
}


#Preview {
    TasksMainView()
}
