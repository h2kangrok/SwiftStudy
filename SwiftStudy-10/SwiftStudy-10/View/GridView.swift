//
//  GridView.swift
//  SwiftStudy-10
//
//  Created by 윤강록 on 2/14/24.
//

import SwiftUI

struct GridView: View {
    @StateObject var gridImageViewModel = GridImageViewModel()

    let spacing: CGFloat = 10
    let horizontalPadding: CGFloat = 10

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                let combinedImages = gridImageViewModel.items.map { $0.name }

                let halfIndex = combinedImages.count / 2
                let firstHalf = Array(combinedImages.prefix(upTo: halfIndex))
                let secondHalf = Array(combinedImages.suffix(from: halfIndex))

                HStack(alignment: .top, spacing: spacing) {
                    VStack {
                        ForEach(gridImageViewModel.addImages.indices, id: \.self) { index in
                            if let image = gridImageViewModel.addImages[index] {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .cornerRadius(10)
                            }
                        }

                        ForEach(firstHalf, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .cornerRadius(10)
                        }
                    }
                    .frame(maxWidth: .infinity)

                    VStack {
                        ForEach(secondHalf, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .cornerRadius(10)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, horizontalPadding)
            }
            .navigationTitle(Text("Grid"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                   ToolbarItem {
                       NavigationLink(destination: AddImageView(addImages: $gridImageViewModel.addImages)) {
                           Image(systemName: "plus.app")
                       }
                   }
               }
        }
    }
}


#Preview {
    GridView()
        .environmentObject(GridImageViewModel())
    
}

