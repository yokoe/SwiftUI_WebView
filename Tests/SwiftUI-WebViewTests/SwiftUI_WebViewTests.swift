import XCTest
import SwiftUI_WebView

final class SwiftUI_WebViewTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertNotNil(WebView(url: URL(string: "http://example.com")!))
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
