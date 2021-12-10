import Foundation

public struct SubtitleSlide: Slide, Identifiable, Codable {
  public let title: Title
  public private(set) var subtitle: Subtitle
  public private(set) var id = UUID()
}

extension SubtitleSlide {
  public init(_ title: String,
              subtitle: String) {
    self.title = Title(contents: title)
    self.subtitle = Subtitle(contents: subtitle )
  }
  
  public init(title: () -> String,
              subtitle: () -> String) {
    self.init(title(),
    subtitle: subtitle())
  }
  
}