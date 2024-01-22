//
//  ContentView.swift
//  SwiftStudy-7
//
//  Created by 윤강록 on 1/21/24.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        VStack {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: geometry.size.width / 2, height: 400)
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: geometry.size.width / 2, height: 400)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
