import Foundation

public struct BulletSlide: Slide, Identifiable, Codable {
  public private(set) var title: Title?
  public let bulletedList: BulletedList
  public private(set) var id = UUID()
}

extension BulletSlide {
  public init(title: String = "",
              bullets: [String]) {
    self.title = title.isEmpty ? nil : Title(contents: title)
    self.bulletedList = BulletedList(bullets: bullets)
  }
  
  public init(title: String = "",
              bullets: () -> [String]) {
    self.init(title: title,
              bullets: bullets())
  }
}
