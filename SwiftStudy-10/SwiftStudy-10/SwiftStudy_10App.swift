//
//  SwiftStudy_10App.swift
//  SwiftStudy-10
//
//  Created by 윤강록 on 2/14/24.
//

import SwiftUI

@main
struct SwiftStudy_10App: App {
    
    @StateObject var gridImageViewModel = GridImageViewModel()
    
    var body: some Scene {
        WindowGroup {
            GridView()
                .environmentObject(gridImageViewModel)
        }
    }
}
