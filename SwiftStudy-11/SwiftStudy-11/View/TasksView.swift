//
//  TasksView.swift
//  SwiftStudy-11
//
//  Created by 윤강록 on 2/29/24.
//

import SwiftUI

struct TasksView: View {
    
    @Binding var tasks: TasksModel

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(tasks.task)
                .font(.system(size: 20, weight: .medium))

            Text("Due date: \(tasks.date, formatter: dateFormatter)")
                .font(.system(size: 14, weight: .light))
            Text("Status: \(tasks.status)")
                .font(.system(size: 20, weight: .regular))
        }
    }
}


