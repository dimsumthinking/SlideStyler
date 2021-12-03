import XCTest
import SlideStyler

final class CodeSlideTests: XCTestCase {
  func testSingleLineListingSlide() {
    let slide = CodeSlide(listing: "import Foundation")
    let lines = slide.listing.singleLines
    let listingSegments = slide.listing.singleLines[0].segments
    XCTAssertEqual(lines.count, 1)
    XCTAssertNil(slide.title)
    XCTAssertNil(slide.location)
    XCTAssertNil(slide.result)
    XCTAssertEqual(listingSegments.count, 1)
    XCTAssertEqual(listingSegments[0].contents,  "import Foundation")
    XCTAssertEqual(listingSegments[0].style, .standard)
  }

  func testAllFieldsFilledSlide() {
    let slide = CodeSlide(title: "New slide",
                          location: "SomePath/<strong>file.swift</strong>",
                          result: "[0, 1, 2]"){
    """
    func testSingleLineListingSlide() {
      let slide = CodeSlide(listing: "import Foundation")
      let lines = <strong>slide</strong>.listing.singleLines
      let listingSegments = slide.listing.singleLines[0].segments
    }
    """
    }
    let title = slide.title
    XCTAssertEqual(title?.singleLines.count, 1)
    XCTAssertEqual(title?.singleLines[0].segments.count, 1)
    XCTAssertEqual(title?.singleLines[0].segments[0].contents, "New slide")
    XCTAssertEqual(title?.singleLines[0].segments[0].style, .standard)
    
    let location = slide.location
    XCTAssertEqual(location?.segments.count, 3)
    XCTAssertEqual(location?.segments[0].contents, "SomePath/")
    XCTAssertEqual(location?.segments[0].style, .standard)
    XCTAssertEqual(location?.segments[1].contents, "file.swift")
    XCTAssertEqual(location?.segments[1].style, .highlighted)
    XCTAssertEqual(location?.segments[2].contents, "")
    XCTAssertEqual(location?.segments[2].style, .standard)

    let result = slide.result
    XCTAssertEqual(result?.segments.count, 1)
    XCTAssertEqual(result?.segments[0].contents, "[0, 1, 2]")
    XCTAssertEqual(result?.segments[0].style, .standard)
    
    let listing = slide.listing
    XCTAssertEqual(listing.singleLines.count, 5)
    XCTAssertEqual(listing.singleLines[0].segments.count, 1)
    XCTAssertEqual(listing.singleLines[0].segments[0].contents, "func testSingleLineListingSlide() {")
    XCTAssertEqual(listing.singleLines[0].segments[0].style, .standard)
    XCTAssertEqual(listing.singleLines[2].segments.count, 3)
    XCTAssertEqual(listing.singleLines[2].segments[0].contents, "  let lines = ")
    XCTAssertEqual(listing.singleLines[2].segments[0].style, .standard)
    XCTAssertEqual(listing.singleLines[2].segments[1].contents, "slide")
    XCTAssertEqual(listing.singleLines[2].segments[1].style, .highlighted)
    XCTAssertEqual(listing.singleLines[2].segments[2].contents, ".listing.singleLines")
    XCTAssertEqual(listing.singleLines[2].segments[2].style, .standard)
  }
  
}
