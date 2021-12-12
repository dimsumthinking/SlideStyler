import Foundation

public struct IntentionallyLeftBlank: SlideContents, Identifiable, Codable {
  public private(set) var id = UUID()
  public init() {}
}
