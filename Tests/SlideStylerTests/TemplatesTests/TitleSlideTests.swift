import XCTest
import SlideStyler

final class TitleSlideTests: XCTestCase {
  func testSingleLineSlide() {
    let slide = TitleSlide("New slide")
    let lines = slide.title.singleLines
    let lineOneSegments = slide.title.singleLines[0].segments
    XCTAssertEqual(lines.count, 1)
    XCTAssertEqual(lineOneSegments.count, 1)
    XCTAssertEqual(lineOneSegments[0].contents,  "New slide")
    XCTAssertEqual(lineOneSegments[0].style, .standard)
  }

  func testMultiplyStyledTitleSlide() {
    let slide = TitleSlide("New <strong>slide </strong><del>example")
    let lines = slide.title.singleLines
    let lineOneSegments = slide.title.singleLines[0].segments
    XCTAssertEqual(lines.count, 1)
    XCTAssertEqual(lineOneSegments.count, 4)
    XCTAssertEqual(lineOneSegments[0].contents,  "New ")
    XCTAssertEqual(lineOneSegments[0].style, .standard)
    XCTAssertEqual(lineOneSegments[1].contents,  "slide ")
    XCTAssertEqual(lineOneSegments[1].style, .highlighted)
    XCTAssertEqual(lineOneSegments[2].contents,  "")
    XCTAssertEqual(lineOneSegments[2].style, .standard)
    XCTAssertEqual(lineOneSegments[3].contents,  "example")
    XCTAssertEqual(lineOneSegments[3].style, .deleted)
  }
  func testMultipleLinesTitleSlide() {
    let slide = TitleSlide {
"""
New slide example
with <strong>more</strong> than one line
"""}
    let lines = slide.title.singleLines
    let lineOneSegments = slide.title.singleLines[0].segments
    let lineTwoSegments = slide.title.singleLines[1].segments
    XCTAssertEqual(lines.count, 2)
    XCTAssertEqual(lineOneSegments.count, 1)
    XCTAssertEqual(lineOneSegments[0].contents,  "New slide example")
    XCTAssertEqual(lineOneSegments[0].style, .standard)
    XCTAssertEqual(lineTwoSegments.count, 3)
    XCTAssertEqual(lineTwoSegments[0].contents,  "with ")
    XCTAssertEqual(lineTwoSegments[0].style, .standard)
    XCTAssertEqual(lineTwoSegments[1].contents,  "more")
    XCTAssertEqual(lineTwoSegments[1].style, .highlighted)
    XCTAssertEqual(lineTwoSegments[2].contents,  " than one line")
    XCTAssertEqual(lineTwoSegments[2].style, .standard)
  }
}
