//
//  GridImageViewModel.swift
//  SwiftStudy-10
//
//  Created by 윤강록 on 2/15/24.
//

import Foundation
import UIKit

class GridImageViewModel: ObservableObject {
    
    @Published var items: [(String, UIImage?)] = [
        
        ("Never give up.Without commitment You'll never start.", UIImage(named: "image1")),
        ("But more importantly without consistency you'll never finish.", UIImage(named: "image2")),
        ("it's not easy. If it were easy there'd be no Dengel Washington.", UIImage(named: "image3")),
         ("So keep working keep striving", UIImage(named: "image4")),
         ("never give up. fall down seven times", UIImage(named: "image5")),
         ("get up eight.", UIImage(named: "image6")),
         ("Eze is a greater threat. to progress than hardship.", UIImage(named: "image7")),
         ("So keep moving, keep growing,", UIImage(named: "image8")),
         ("see yet work.", UIImage(named: "image9")),
         ("keep learning.", UIImage(named: "image10"))
         ]
         }
