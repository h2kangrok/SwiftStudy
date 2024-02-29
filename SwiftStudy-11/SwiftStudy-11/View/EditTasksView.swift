//
//  EditTasksView.swift
//  SwiftStudy-11
//
//  Created by 윤강록 on 2/29/24.
//

import SwiftUI

struct EditTasksView: View {
    
    @Binding var task: TasksModel
    @State private var date = Date()
    
    var body: some View {
        VStack {
            Text("heelo")
            DatePicker(
                "Start Date",
                selection: $task.date,
                displayedComponents: [.date])
            Picker("Task Status", selection: $task.status) {
                ForEach(TaskStatus.allCases, id: \.self) { status in
                    Text(status.rawValue).tag(status)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

