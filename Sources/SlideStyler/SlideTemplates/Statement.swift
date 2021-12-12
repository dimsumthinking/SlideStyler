import Foundation

public struct Statement: SlideContents, Identifiable, Codable {
  public let text: Title
  public private(set) var id = UUID()
}

extension Statement {
  public init(_ title: String) {
    self.text = Title(contents: title)
  }
  
  public init(title: () -> String) {
    self.init(title())
  }
}
