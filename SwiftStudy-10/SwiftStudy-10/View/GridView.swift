//
//  GridView.swift
//  SwiftStudy-10
//
//  Created by 윤강록 on 2/14/24.
//

import SwiftUI

struct GridView: View {
    @StateObject var gridImageViewModel = GridImageViewModel()
    @State var firstNaviLinkActive = false
    
    let spacing: CGFloat = 10
    let horizontalPadding: CGFloat = 10
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                
                HStack(alignment: .top, spacing: spacing) {
                    LazyVStack {
                        ForEach(gridImageViewModel.items.indices.filter { $0 % 2 == 0 }, id: \.self) { index in
                            let (content, image) = gridImageViewModel.items[index]
                            VStack {
                                Image(uiImage: image ?? UIImage())
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .cornerRadius(10)
                                
                                Text(content)
                                
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    LazyVStack {
                        ForEach(gridImageViewModel.items.indices.filter { $0 % 2 != 0 }, id: \.self) { index in
                            let (content, image) = gridImageViewModel.items[index]
                            VStack {
                                Image(uiImage: image ?? UIImage())
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .cornerRadius(10)
                                
                                Text(content)
                                
                            }
                        }
                    }
                    
                    
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, horizontalPadding)
            .navigationTitle(Text("GridView"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: AddImageView(firstNaviLinkActive: $firstNaviLinkActive, items: $gridImageViewModel.items), isActive: $firstNaviLinkActive) {
                        Image(systemName: "plus.app")
                    }
                }
            }
        }
    }
}

#Preview {
    GridView()
}


