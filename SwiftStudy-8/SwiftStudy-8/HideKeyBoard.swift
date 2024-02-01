//
//  HideKeyBoard.swift
//  SwiftStudy-8
//
//  Created by 윤강록 on 1/31/24.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
