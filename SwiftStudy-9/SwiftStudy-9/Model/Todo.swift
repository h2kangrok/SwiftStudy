//
//  Todo.swift
//  SwiftStudy-9
//
//  Created by 윤강록 on 2/5/24.
//

import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    let doing: String
    var done: Bool = false
}
