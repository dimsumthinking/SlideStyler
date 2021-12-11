import Foundation

public struct SingleThought: SlideContents, Identifiable, Codable {
  public let title: Title
  public private(set) var id = UUID()
}

extension SingleThought {
  public init(_ title: String) {
    self.title = Title(contents: title)
  }
  
  public init(title: () -> String) {
    self.init(title())
  }
}
