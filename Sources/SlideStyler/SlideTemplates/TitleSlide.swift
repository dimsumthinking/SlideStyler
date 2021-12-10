import Foundation

public struct TitleSlide: Slide, Identifiable, Codable {
  public let title: Title
  public private(set) var id = UUID()
}

extension TitleSlide {
  public init(_ title: String) {
    self.title = Title(contents: title)
  }
  
  public init(title: () -> String) {
    self.init(title())
  }
}
