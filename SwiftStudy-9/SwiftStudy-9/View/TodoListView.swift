//
//  TodoListView.swift
//  SwiftStudy-9
//
//  Created by 윤강록 on 2/5/24.
//

import SwiftUI

struct TodoListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var isActive: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack {
                    Button {
                        isActive = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .padding(1)
                            .padding(.leading, 300)
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                    }
                }
                Text("Todo list")
                    .padding(.trailing, 200)
                    .font(.system(size: 40, weight: .bold))
                List {
                    ForEach(listViewModel.todos.indices, id: \.self) { index in
                        HStack {
                            Text(listViewModel.todos[index].doing)
                            Toggle("", isOn: $listViewModel.todos[index].done)
                        }
                    }
                }
            }
            if isActive {
                AddView(isActive: $isActive)
            }
        }
    }
}
#Preview {
    TodoListView()
        .environmentObject(ListViewModel())
}





