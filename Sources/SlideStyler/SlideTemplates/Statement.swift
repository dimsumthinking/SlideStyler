import Foundation

public struct Statement: SlideContents, Identifiable, Codable {
  public let title: Title
  public private(set) var id = UUID()
}

extension Statement {
  public init(_ title: String) {
    self.title = Title(contents: title)
  }
  
  public init(title: () -> String) {
    self.init(title())
  }
}
