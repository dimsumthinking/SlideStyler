import XCTest
import SlideStyler

final class SlideComponentTests: XCTestCase {
  func testEmptyListing() {
    let listing = SlideComponent(contents: "")
    XCTAssertEqual(listing.singleLines.count, 1)
    XCTAssertEqual(listing.singleLines[0].segments.count, 1)
    XCTAssertEqual(listing.singleLines.first?.segments.first?.contents, "")
    XCTAssertEqual(listing.singleLines.first?.segments.first?.style, .standard)
  }
  
  func testSingleLineListing() {
    let listing = SlideComponent(contents: "This is a test")
    XCTAssertEqual(listing.singleLines.count, 1)
    XCTAssertEqual(listing.singleLines[0].segments.count, 1)
    XCTAssertEqual(listing.singleLines.first?.segments.first?.contents, "This is a test")
    XCTAssertEqual(listing.singleLines.first?.segments.first?.style, .standard)
  }
  
  func testSingleLineListingWithTag() {
    let listing = SlideComponent(contents: "This is a <del>test</del> of something")
    XCTAssertEqual(listing.singleLines.count, 1)
    XCTAssertEqual(listing.singleLines[0].segments.count, 3)
    XCTAssertEqual(listing.singleLines[0].segments[0].contents, "This is a ")
    XCTAssertEqual(listing.singleLines[0].segments[0].style, .standard)
    XCTAssertEqual(listing.singleLines[0].segments[1].contents, "test")
    XCTAssertEqual(listing.singleLines[0].segments[1].style, .deleted)
    XCTAssertEqual(listing.singleLines[0].segments[2].contents, " of something")
    XCTAssertEqual(listing.singleLines[0].segments[2].style, .standard)
  }
  
  func testListingWhereTagExtendsOverMultipleLines() {
    let listing = SlideComponent(contents:
"""
This is a <del>test of something
 like</del> what <em>I don't know</em>
"""
)
    XCTAssertEqual(listing.singleLines.count, 2)
    XCTAssertEqual(listing.singleLines[0].segments.count, 2)
    XCTAssertEqual(listing.singleLines[0].segments[0].contents, "This is a ")
    XCTAssertEqual(listing.singleLines[0].segments[0].style, .standard)
    XCTAssertEqual(listing.singleLines[0].segments[1].contents, "test of something")
    XCTAssertEqual(listing.singleLines[0].segments[1].style, .deleted)
    XCTAssertEqual(listing.singleLines[1].segments.count, 4)
    XCTAssertEqual(listing.singleLines[1].segments[0].contents, " like")
    XCTAssertEqual(listing.singleLines[1].segments[0].style, .deleted)
    XCTAssertEqual(listing.singleLines[1].segments[1].contents, " what ")
    XCTAssertEqual(listing.singleLines[1].segments[1].style, .standard)
    XCTAssertEqual(listing.singleLines[1].segments[2].contents, "I don't know")
    XCTAssertEqual(listing.singleLines[1].segments[2].style, .special)
    XCTAssertEqual(listing.singleLines[1].segments[3].contents, "")
    XCTAssertEqual(listing.singleLines[1].segments[3].style, .standard)
  }
}
