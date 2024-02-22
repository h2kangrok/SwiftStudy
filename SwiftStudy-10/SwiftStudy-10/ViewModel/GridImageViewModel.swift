//
//  GridImageViewModel.swift
//  SwiftStudy-10
//
//  Created by 윤강록 on 2/15/24.
//

import Foundation
import UIKit

class GridImageViewModel: ObservableObject {
    
    @Published var items: [GridItem] = []
    @Published var addImages: [UIImage?] = []
    
    init() {
        getItem()
    }
    
    func getItem() {
        let images = [
            GridItem(name: "image1", text: "안녕"),
            GridItem(name: "image2",text: "안녕"),
            GridItem(name: "image3",text: "안녕"),
            GridItem(name: "image4",text: "안녕"),
//            GridItem(name: "image5"),
//            GridItem(name: "image6"),
//            GridItem(name: "image7"),
//            GridItem(name: "image8"),
//            GridItem(name: "image9"),
//            GridItem(name: "image10")
        ]
        items.append(contentsOf: images)
    }
}


