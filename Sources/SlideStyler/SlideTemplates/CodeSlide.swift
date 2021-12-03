import Foundation

public struct CodeSlide: Slide, Identifiable, Codable {
  public private(set) var title: Title?
  public private(set) var location: CodeLocation?
  public let listing: CodeListing
  public private(set) var result: CodeResult?
  public private(set) var id = UUID()
}

extension CodeSlide {
  public init(title: String = "",
              location: String = "",
              result: String = "",
              listing: String) {
    self.title = title.isEmpty ? nil : Title(contents: title)
    self.location = location.isEmpty ? nil : CodeLocation(contents: location)
    self.result = result.isEmpty ? nil : CodeResult(contents: result)
    self.listing = CodeListing(contents: listing)
  }
  
  public init(title: String = "",
              location: String = "",
              result: String = "",
              listing: () -> String) {
    self.init(title: title,
              location: location,
              result: result,
              listing: listing())
  }
  
}
