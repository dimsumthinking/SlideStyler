import XCTest
import SlideStyler

final class SlideLineTests: XCTestCase {
  func testEmptyLine() {
    let line = StyledLine(contents: "")
    XCTAssertEqual(line.segments.count,1)
    XCTAssertEqual(line.segments.first?.contents, "")
    XCTAssertEqual(line.segments.first?.style, .standard)
  }
  
  func testLineWithNoTag() {
    let line = StyledLine(contents: "Test")
    XCTAssertEqual(line.segments.count, 1)
    XCTAssertEqual(line.segments.first?.contents, "Test")
    XCTAssertEqual(line.segments.first?.style, .standard)
  }
  
  func testLineWithOpeningTagInMiddle() {
    let line = StyledLine(contents: "Test<del>ing this")
    XCTAssertEqual(line.segments.count, 2)
    XCTAssertEqual(line.segments[0].contents, "Test")
    XCTAssertEqual(line.segments[0].style, .standard)
    XCTAssertEqual(line.segments[1].contents, "ing this")
    XCTAssertEqual(line.segments[1].style, .deleted)
  }
  
  func testLineWithOpeningAndClosingTagInMiddle() {
    let line = StyledLine(contents: "Test<del>ing</del> this")
    XCTAssertEqual(line.segments.count, 3)
    XCTAssertEqual(line.segments[0].contents, "Test")
    XCTAssertEqual(line.segments[0].style, .standard)
    XCTAssertEqual(line.segments[1].contents, "ing")
    XCTAssertEqual(line.segments[1].style, .deleted)
    XCTAssertEqual(line.segments[2].contents, " this")
    XCTAssertEqual(line.segments[2].style, .standard)
  }
  
  func testLineStartingWithOpeningTag() {
    let line = StyledLine(contents: "<del>Test")
    XCTAssertEqual(line.segments.count, 2)
    XCTAssertEqual(line.segments[0].contents, "")
    XCTAssertEqual(line.segments[0].style, .standard)
    XCTAssertEqual(line.segments[1].contents, "Test")
    XCTAssertEqual(line.segments[1].style, .deleted)
  }
  
  func testLineStartingWithTextAndClosingTag() {
    let line = StyledLine(contents: "end of</del> and",
                        startingStyle: .deleted )
    XCTAssertEqual(line.segments.count, 2)
    XCTAssertEqual(line.segments[0].contents, "end of")
    XCTAssertEqual(line.segments[0].style, .deleted)
    XCTAssertEqual(line.segments[1].contents, " and")
    XCTAssertEqual(line.segments[1].style, .standard)
  }
  
  func testLineStartingWithClosingTag() {
    let line = StyledLine(contents: "</del> and",
                        startingStyle: .deleted )
    XCTAssertEqual(line.segments.count, 2)
    XCTAssertEqual(line.segments[0].contents, "")
    XCTAssertEqual(line.segments[0].style, .deleted)
    XCTAssertEqual(line.segments[1].contents, " and")
    XCTAssertEqual(line.segments[1].style, .standard)
  }
  
  func testLineEndingWithOpeningTag() {
    let line = StyledLine(contents: "This line ends with <del>")
    XCTAssertEqual(line.segments.count, 2)
    XCTAssertEqual(line.segments[0].contents, "This line ends with ")
    XCTAssertEqual(line.segments[0].style, .standard)
    XCTAssertEqual(line.segments[1].contents, "")
    XCTAssertTrue(line.segments[1].contents.isEmpty)
    XCTAssertEqual(line.segments[1].style, .deleted)
  }
  
  func testLineEndingWithClosingTag() {
    let line = StyledLine(contents: "This line ends with </del>",
                        startingStyle: .deleted)
    XCTAssertEqual(line.segments.count, 2)
    XCTAssertEqual(line.segments[0].contents, "This line ends with ")
    XCTAssertEqual(line.segments[0].style, .deleted)
    XCTAssertEqual(line.segments[1].contents, "")
    XCTAssertEqual(line.segments[1].style, .standard)
  }
  
  func testLineContainingOnlyOpeningTag() {
    let line = StyledLine(contents: "<del>",
                        startingStyle: .standard)
    XCTAssertEqual(line.segments.count, 2)
    XCTAssertEqual(line.segments[0].contents, "")
    XCTAssertEqual(line.segments[0].style, .standard)
    XCTAssertEqual(line.segments[1].contents, "")
    XCTAssertEqual(line.segments[1].style, .deleted)
  }
  
  func testLineContainingOnlyClosingTag() {
    let line = StyledLine(contents: "</del>",
                        startingStyle: .deleted)
    XCTAssertEqual(line.segments.count, 2)
    XCTAssertEqual(line.segments[0].contents, "")
    XCTAssertEqual(line.segments[0].style, .deleted)
    XCTAssertEqual(line.segments[1].contents, "")
    XCTAssertEqual(line.segments[1].style, .standard)
  }
  
  func testLineWithMultipleTags() {
    let line = StyledLine(contents: "this</del> that and <strong>the other</strong> thing",
                        startingStyle: .deleted)
    XCTAssertEqual(line.segments.count, 4)
    XCTAssertEqual(line.segments[0].contents, "this")
    XCTAssertEqual(line.segments[0].style, .deleted)
    XCTAssertEqual(line.segments[1].contents, " that and ")
    XCTAssertEqual(line.segments[1].style, .standard)
    XCTAssertEqual(line.segments[2].contents, "the other")
    XCTAssertEqual(line.segments[2].style, .highlighted)
    XCTAssertEqual(line.segments[3].contents, " thing")
    XCTAssertEqual(line.segments[3].style, .standard)
  }
  
  func testLineWithNoSpaceBetweenCloseAndOpenTags() {
    let line = StyledLine(contents: "this </del><strong>and that",
                        startingStyle: .deleted)
    XCTAssertEqual(line.segments.count, 3)
    XCTAssertEqual(line.segments[0].contents, "this ")
    XCTAssertEqual(line.segments[0].style, .deleted)
    XCTAssertEqual(line.segments[1].contents, "")
    XCTAssertEqual(line.segments[1].style, .standard)
    XCTAssertEqual(line.segments[2].contents, "and that")
    XCTAssertEqual(line.segments[2].style, .highlighted)
  }
}
