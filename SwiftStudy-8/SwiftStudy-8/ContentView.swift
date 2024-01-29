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
                VStack {
                    Text("이름 들어갈 곳 (textField로 변경해야 함)")
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
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
