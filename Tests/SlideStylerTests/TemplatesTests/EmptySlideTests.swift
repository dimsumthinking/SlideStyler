import XCTest
import SlideStyler

final class EmptySlideTests: XCTestCase {
  func testSingleLineListingSlide() {
    let slide = EmptySlide()
    XCTAssertNotNil(slide)
  }
}
