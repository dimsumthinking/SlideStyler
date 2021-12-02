import Foundation

public struct TitleSlide: Slide, Identifiable, Codable {
  public let title: Title
  public private(set) var id = UUID()
}

extension TitleSlide {
  public init(_ string: String) {
    title = Title(contents: string)
  }
  
  public init(string: () -> String) {
    self.init(string())
  }
}
