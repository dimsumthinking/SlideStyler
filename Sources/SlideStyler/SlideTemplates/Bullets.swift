import Foundation

public struct Bullets: SlideContents, Identifiable, Codable {
  public private(set) var title: Title?
  public let bulletedList: BulletedList
  public private(set) var id = UUID()
}

extension Bullets {
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

extension Bullets {
  public var list: [Bullet] {
    bulletedList.bullets
  }
}
