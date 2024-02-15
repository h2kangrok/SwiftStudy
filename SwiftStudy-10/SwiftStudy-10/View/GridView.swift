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
                    LazyVStack {
                        ForEach (gridImageViewModel.items.prefix(gridImageViewModel.items.count/2), id: \.id) { image in
                            Image(image.name)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .cornerRadius(10)
                        }
                    }
                    LazyVStack {
                        ForEach (gridImageViewModel.items.suffix(gridImageViewModel.items.count/2), id: \.id) { image in
                            Image(image.name)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .cornerRadius(10)
                            
                        }
                    }
                }
                .padding(.horizontal, horizontalPadding)
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink (destination: AddImageView()){
                        Image(systemName: "plus.app")
                    }
                }
            }
            .navigationTitle(Text("gird"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    GridView()
        .environmentObject(GridImageViewModel())
        
}
