//
//  AddView.swift
//  SwiftStudy-9
//
//  Created by 윤강록 on 2/6/24.
//

import SwiftUI

struct AddView: View {
    
    @State var todo: String = ""
    @State private var offset: CGFloat = 1000
    @Binding var isActive: Bool
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.5)
                .onTapGesture {
                    close()
                }
            VStack {
                TextField("add your todo", text: $todo)
                    .padding(5)
                    .background(Color(uiColor: .secondarySystemBackground))
                
                
                Button {
                    addButtonPressed()
                    close()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(todo.isEmpty ? Color.gray : Color.blue)
                        
                        Text("Add")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                    }
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 20)
            .padding(10)
            
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func close() {
        withAnimation(.spring()) {
            offset = 1000
            isActive = false
        }
    }
    
    func addButtonPressed() {
        listViewModel.addTodo(doing: todo)
    }
}

#Preview {
    AddView(isActive: .constant(true))
        .environmentObject(ListViewModel())
}
