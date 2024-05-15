//
//  AddImageView.swift
//  SwiftStudy-10
//
//  Created by 윤강록 on 2/14/24.
//

import SwiftUI

let steelGray = Color(white: 0.7)

struct AddImageView: View {
    @State private var shouldShowImagePicker = false
    @State private var image: UIImage?
    @State private var contents = ""
    @Binding var firstNaviLinkActive: Bool
    @Binding var items: [(String, UIImage?)]
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center) {
                Button {
                    shouldShowImagePicker.toggle()
                } label: {
                    if let image = self.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300)
                            .cornerRadius(25)
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(steelGray)
                                .frame(width: 300, height: 300)
                            Text("이미지를 추가하세요.")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                TextField("내용을 입력하세요.", text: $contents, axis: .vertical)
                    .frame(width: 300, height: 200)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer()
                
                Button {
                    addButtonPressed()
                    firstNaviLinkActive = false
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10.0)
                            .frame(width: 300, height: 50)
                        Text("Add")
                            .foregroundColor(.white)
                    }
                    
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $shouldShowImagePicker) {
            ImagePicker(image: $image)
                .ignoresSafeArea()
        }
    }
    
    func addButtonPressed() {
        self.items.append((self.contents, self.image))
    }
}

#Preview {
    AddImageView(firstNaviLinkActive: .constant(true), items: .constant([]))
}


