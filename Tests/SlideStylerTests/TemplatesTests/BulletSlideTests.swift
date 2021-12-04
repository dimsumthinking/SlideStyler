import XCTest
import SlideStyler

final class BulletSlideTests: XCTestCase {
  func testSingleLineListingSlide() {
    let slide = BulletSlide {[
      "This is bullet one",
      "This is <strong>bullet</strong> two",
      """
      This is
      bullet three
      """
    ]}
    let title = slide.title
    let bullets = slide.bulletedList.bullets
    XCTAssertNil(title)
    XCTAssertEqual(bullets.count, 3)
    XCTAssertEqual(bullets[0].singleLines[0].segments[0].contents, "This is bullet one")
    XCTAssertEqual(bullets[1].singleLines[0].segments.count, 3)
    XCTAssertEqual(bullets[1].singleLines[0].segments[0].contents, "This is ")
    XCTAssertEqual(bullets[1].singleLines[0].segments[0].style, .standard)
    XCTAssertEqual(bullets[1].singleLines[0].segments[1].contents, "bullet")
    XCTAssertEqual(bullets[1].singleLines[0].segments[1].style, .highlighted)
    XCTAssertEqual(bullets[1].singleLines[0].segments[0].contents, "This is ")
    XCTAssertEqual(bullets[1].singleLines[0].segments[2].style, .standard)
    XCTAssertEqual(bullets[2].singleLines.count, 2)
    XCTAssertEqual(bullets[2].singleLines[0].segments[0].contents, "This is")
    XCTAssertEqual(bullets[2].singleLines[1].segments[0].contents, "bullet three")

  }
}
