public enum SegmentStyle: String, Codable, CaseIterable {
  case standard
  case highlighted = "strong"
  case deleted = "del"
  case special = "em"
  case hidden
}

extension SegmentStyle {
  public static func from(tag: String) -> SegmentStyle {
    guard (openingTags.contains(tag)) else {return .standard}
    return SegmentStyle(rawValue: tag.removingFirst.removingLast) ?? .standard
  }
}

extension String {
  fileprivate var removingFirst: String {
    var mutableSelf = self
    mutableSelf.removeFirst()
    return mutableSelf
  }
  fileprivate var removingLast: String {
    var mutableSelf = self
    mutableSelf.removeLast()
    return mutableSelf
  }
}

extension SegmentStyle {
  public static let tags = openingTags + closingTags
  
  public static let openingTags
  = SegmentStyle
    .allCases
    .dropFirst()
    .map {style in "<\(style.rawValue)>"}
  
  public static let closingTags
  = SegmentStyle
    .allCases
    .dropFirst()
    .map {style in "</\(style.rawValue)>"}
}
