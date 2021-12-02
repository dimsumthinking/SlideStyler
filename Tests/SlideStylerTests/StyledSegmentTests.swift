import XCTest
import SlideStyler

final class StyledSegmentTests: XCTestCase {
  func testStandardSegment() {
    let standardSegment = StyledSegment.init(contents: "Test",
                                           style: .standard)
    XCTAssertEqual(standardSegment.contents, "Test")
    XCTAssertEqual(standardSegment.style, .standard)
    XCTAssertEqual(standardSegment.description, standardSegment.contents)
    XCTAssertEqual(standardSegment.description, "Test")
  }
  
  func testHiddenSegment() {
    let hiddenSegment = StyledSegment.init(contents: "Test",
                                           style: .hidden)
    XCTAssertEqual(hiddenSegment.contents, "Test")
    XCTAssertEqual(hiddenSegment.style, .hidden)
    XCTAssertEqual(hiddenSegment.description, "<hidden>Test</hidden>")
  }
  
  func testHighlightedSegment() {
    let highlightedSegment = StyledSegment.init(contents: "Test",
                                              style: .highlighted)
    XCTAssertEqual(highlightedSegment.contents, "Test")
    XCTAssertEqual(highlightedSegment.style, .highlighted)
    XCTAssertEqual(highlightedSegment.description, "<strong>Test</strong>")
  }
}
