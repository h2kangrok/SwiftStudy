//
//  ContentView.swift
//  SwiftStudy-8
//
//  Created by 윤강록 on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    ZStack (alignment: .top){
                        Rectangle()
                            .foregroundColor(Color.gray)
                            .edgesIgnoringSafeArea(.top)
                            .frame(height: 150)
                        VStack {
                            HStack (spacing: 250){
                                Button {
                                    
                                } label: {
                                    Text("Back")
                                }
                                Button {
                                    hideKeyboard()
                                } label: {
                                    Text("Sign Up")
                                }
                            } .padding(.bottom, 50)
                            
                            Button {
                                shouldShowImagePicker.toggle()
                            } label: {
                                VStack {
                                    if let image = self.image {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 143, height: 143)
                                            .cornerRadius(80)
                                    } else {
                                        RoundedRectangle(cornerRadius: 80)
                                            .stroke(Color.black, lineWidth: 10)
                                            .fill(Color.blue)
                                            .frame(width: 160, height: 160)
                                            .overlay(
                                                Image(systemName: "person.fill")
                                                    .font(.system(size:100))
                                                    .padding()
                                                    .foregroundColor(.black))
                                    }
                                }
                            }
                        }
                    }
                } .padding(.bottom, 20)
                VStack (alignment: .center){
                    TextField("닉네임을 입력하세요",text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 300, height: 50)
                        .cornerRadius(8)
                }
                
                Spacer()
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}

