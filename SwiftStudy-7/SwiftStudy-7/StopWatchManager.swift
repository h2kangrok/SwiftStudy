//
//  StopWatchManager.swift
//  SwiftStudy-7
//
//  Created by 윤강록 on 1/22/24.
//

import Foundation
import SwiftUI

class StopWatchManager: ObservableObject {
    
    enum StopWatchMode{
        case running
        case paused
        case reset
    }
    @Published var mode: StopWatchMode?
    @Published var secondsElpsed = 0.0
    var timer = Timer()
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in self.secondsElpsed += 0.1
        }
        mode = .running
    }
    func pause() {
        timer.invalidate()
        mode = .paused
    }
    func reset() {
        timer.invalidate()
        secondsElpsed = 0
        mode = .reset
    }
}
