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
    @Published var additionalImages: [UIImage] = []
    
    init() {
        getItem()
    }
    
    func getItem() {
        let images = [
            GridItem(name: "image1",image: UIImage(named: "image1")!),
            GridItem(name: "image2",image: UIImage(named: "image2")!),
            GridItem(name: "image3",image: UIImage(named: "image3")!),
            GridItem(name: "image4",image: UIImage(named: "image4")!),
            GridItem(name: "image5",image: UIImage(named: "image5")!),
            GridItem(name: "image6",image: UIImage(named: "image6")!),
            GridItem(name: "image7",image: UIImage(named: "image7")!),
            GridItem(name: "image8",image: UIImage(named: "image8")!),
            GridItem(name: "image9",image: UIImage(named: "image9")!),
            GridItem(name: "image10",image: UIImage(named: "image10")!)
        ]
        items.append(contentsOf: images)
    }
    
    func addItem(image: UIImage, imageName: String) {
          let gridItem = GridItem(name: imageName, image: image)
          items.append(gridItem)
          additionalImages.append(image) // 추가된 이미지 배열에 추가
      }
}


