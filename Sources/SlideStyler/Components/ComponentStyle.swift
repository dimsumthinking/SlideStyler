public enum ComponentStyle: String, Codable, CaseIterable {
  case standard
  case highlighted = "strong"
  case deleted = "del"
  case special = "em"
  case hidden
}

extension ComponentStyle {
  public static func from(tag: String) -> ComponentStyle {
    guard (openingTags.contains(tag)) else {return .standard}
    return ComponentStyle(rawValue: tag.removingFirst.removingLast) ?? .standard
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

extension ComponentStyle {
  public static let tags = openingTags + closingTags
  
  public static let openingTags
  = ComponentStyle
    .allCases
    .dropFirst()
    .map {style in "<\(style.rawValue)>"}
  
  public static let closingTags
  = ComponentStyle
    .allCases
    .dropFirst()
    .map {style in "</\(style.rawValue)>"}
}
