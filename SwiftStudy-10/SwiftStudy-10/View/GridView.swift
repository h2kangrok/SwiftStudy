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
        NavigationStack {
            ScrollView (showsIndicators: false) {
                HStack (alignment: .top, spacing: spacing) {
                    VStack {
                        ForEach(gridImageViewModel.items, id: \.id) { image in
                            Image(image.name)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .cornerRadius(10)
                        }
                    }
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
                    }
                }
                .padding(.horizontal, horizontalPadding)
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: AddImageView(addImages: $gridImageViewModel.addImages)) {
                        Image(systemName: "plus.app")
                    }
                }
            }
            .navigationTitle(Text("Grid"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    GridView()
        .environmentObject(GridImageViewModel())
        
}
