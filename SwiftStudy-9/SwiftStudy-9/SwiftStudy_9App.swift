//
//  SwiftStudy_9App.swift
//  SwiftStudy-9
//
//  Created by 윤강록 on 2/5/24.
//

import SwiftUI

@main
struct SwiftStudy_9App: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            TodoListView()
        }
        .environmentObject(listViewModel)
    }
}
