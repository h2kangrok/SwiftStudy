//
//  CollectionViewMainCell.swift
//  SwiftStudy-3
//
//  Created by 윤강록 on 11/17/23.
//

import UIKit
import SnapKit

class CollectionViewMainCell: UICollectionViewCell {
    let cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        return imageView
    }()

    func initCell() {
        addSubview(cellImage)
        
        cellImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
