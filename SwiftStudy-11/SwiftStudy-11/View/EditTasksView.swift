//
//  EditTasksView.swift
//  SwiftStudy-11
//
//  Created by 윤강록 on 2/29/24.
//

import SwiftUI

struct EditTasksView: View {
    
    @Binding var task: TasksModel
    
    var body: some View {
        VStack {
            TextField("New Task", text: $task.task)
            DatePicker(
                "Start Date",
                selection: $task.date,
                displayedComponents: [.date])
            Picker("Task Status", selection: $task.status) {
                    Text("Not Started").tag("Not Started")
                    Text("In progress").tag("In progress")
                    Text("Complete").tag("Complete")
                }
            }
            .pickerStyle(.segmented)
        }
    }


