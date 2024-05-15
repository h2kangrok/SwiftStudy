//
//  SwiftStudy_17Tests.swift
//  SwiftStudy-17Tests
//
//  Created by 윤강록 on 5/14/24.
//

import XCTest

@testable import SwiftStudy_17

final class SwiftStudy_17Tests: XCTestCase {
    
    var nextAndPreviousButtonView: NextAndPreviousButton?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // 변수 초기화?
        try super.setUpWithError()
        nextAndPreviousButtonView = NextAndPreviousButton(currentPage: .constant(0))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        nextAndPreviousButtonView = nil
        try super.tearDownWithError()
    }
    
    func testNextButton_2To0() {
        let isNext = true
        var currentPage = 2
        currentPage = nextAndPreviousButtonView!.updateCurrentPage(isNext: isNext, currentPage: currentPage)
        XCTAssertEqual(0, currentPage)
    }

}
