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
    @State private var imageName = ""
    @EnvironmentObject var gridImageViewModel: GridImageViewModel

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
                
                TextField("이미지 이름을 입력하세요.", text: $imageName)
                    .padding()
                TextField("내용을 입력하세요.", text: $contents)
                    .padding()
                
                Spacer()
                
                Button {
                    addButtonPressed()
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
        guard let image = self.image else {
            // 이미지가 nil인 경우 처리
            return
        }
        gridImageViewModel.addItem(image: image, imageName: imageName)
    }}


#Preview {
   AddImageView()
        .environmentObject(GridImageViewModel())
        
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    private let controller = UIImagePickerController()

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.image = info[.originalImage] as? UIImage
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        controller.delegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}




