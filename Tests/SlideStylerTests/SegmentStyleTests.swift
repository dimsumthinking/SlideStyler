import XCTest
import SlideStyler

final class SegmentStyleTests: XCTestCase {
  func testStandardStyle() {
    let standardStyle = SegmentStyle.from(tag: "")
    XCTAssertEqual(standardStyle, .standard)
  }
  func testHighlightedStyle() {
    let highlightedStyle = SegmentStyle.from(tag: "<strong>")
    XCTAssertEqual(highlightedStyle, .highlighted)
  }
  func testEndTagStyle() {
    let endTagStyle = SegmentStyle.from(tag: "</strong>")
    XCTAssertEqual(endTagStyle, .standard)
  }
  func testTagCollections() {
    let tag = "</strong>"
    XCTAssertTrue(SegmentStyle.tags.contains(tag))
    XCTAssertTrue(SegmentStyle.closingTags.contains(tag))
    XCTAssertFalse(SegmentStyle.openingTags.contains(tag))
  }
}
