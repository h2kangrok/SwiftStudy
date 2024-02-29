//
//  TasksMainView.swift
//  SwiftStudy-11
//
//  Created by 윤강록 on 2/29/24.
//

import SwiftUI

struct TasksMainView: View {
    
    @State private var tasks: [TasksModel] = []
    

    
    var body: some View {
        NavigationView {
            List {
                
                ForEach($tasks) { task in
                    VStack(alignment: .leading) {
                        TasksView(tasks: task)
                        
                    }
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addTasks()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Edit") {
                        
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
    
    
}


#Preview {
    TasksMainView()
}
