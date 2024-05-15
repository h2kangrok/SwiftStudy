//
//  TasksModel.swift
//  SwiftStudy-11
//
//  Created by 윤강록 on 2/29/24.
//

import SwiftUI

struct TasksModel: Identifiable {
    var id = UUID()
    var task: String
    var date: Date
    var status: String
}

