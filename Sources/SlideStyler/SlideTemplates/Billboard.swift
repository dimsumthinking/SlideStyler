import Foundation

public struct Billboard: SlideContents, Identifiable, Codable {
  public let title: Title
  public let subtitle: Subtitle
  public let info: [Info]
  public private(set) var id = UUID()
}

extension Billboard {
  public init(title: String,
              subtitle: String,
              info: [String]) {
    self.title = Title(contents: title)
    self.subtitle = Subtitle(contents: subtitle)
    self.info = info.map{contents in Info(contents: contents)}
  }
  
  public init(title: () -> String,
              subtitle: () -> String,
              info: () -> [String]) {
    self.init(title: title(),
              subtitle: subtitle(),
              info: info())
  }
}
