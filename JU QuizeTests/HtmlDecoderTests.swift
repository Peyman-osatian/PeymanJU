//
//  HtmlDecoderTests.swift
//  JU QuizeTests
//
//  Created by Mahsa  on 2020-12-06.
//  Copyright © 2020 com.mahsa. All rights reserved.
//

import XCTest
@testable import JU_Quize

class HtmlDecoderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testHtmlDecoding() throws {
        let encodedString = "&quot;"
        XCTAssertEqual(encodedString.htmlDecoded, "\"")
        
        let encodedUmlaut = "&auml;"
        XCTAssert(encodedUmlaut.htmlDecoded == "ä")
    }

    
}
