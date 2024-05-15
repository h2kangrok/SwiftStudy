//
//  ViewHeader.swift
//  SwiftStudy-3
//
//  Created by 윤강록 on 11/13/23.
//

import UIKit
import SnapKit

class ViewHeader: UICollectionReusableView {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    func initHeader() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstrain { make in
            make.top.equalToSuperview().off(50)
            make.centerX.equalToSuperview()
        }
    }
}


