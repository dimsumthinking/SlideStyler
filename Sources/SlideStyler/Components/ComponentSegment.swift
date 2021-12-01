import Foundation

public struct ComponentSegment: Codable, Identifiable {
  public private(set) var id = UUID()
  public let contents: String
  public private(set) var style: ComponentStyle = .standard
}

extension ComponentSegment {
  public init(contents: String,
              style: ComponentStyle = .standard) {
    self.contents = contents
    self.style = style
  }
}

extension ComponentSegment: CustomStringConvertible {
  public var description: String {
    switch self.style {
    case .standard:
      return contents
    default:
      return "<\(style.rawValue)>\(contents)</\(style.rawValue)>"
    }
  }
}
