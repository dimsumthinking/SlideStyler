import Foundation

public struct StyledSegment: Codable, Identifiable {
  public private(set) var id = UUID()
  public let contents: String
  public private(set) var style: SegmentStyle = .standard
}

extension StyledSegment {
  public init(contents: String,
              style: SegmentStyle = .standard) {
    self.contents = contents
    self.style = style
  }
}

extension StyledSegment: CustomStringConvertible {
  public var description: String {
    switch self.style {
    case .standard:
      return contents
    default:
      return "<\(style.rawValue)>\(contents)</\(style.rawValue)>"
    }
  }
}
